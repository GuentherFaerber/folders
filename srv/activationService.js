async function activate(req) {
  try {
    // definition
    let cdl = `
        @cds.persistence.exists
        entity ModelingService_Currencies {
        key code   : String(3) @(title : '{i18n>CurrencyCode}');
            symbol : String(5) @(title : '{i18n>CurrencySymbol}');
        }
    
        @cds.persistence.exists
        entity ModelingService_FieldValues {
            envId: String;
            ver: String;
            field: String @title: 'Field';
            value: String @title: 'Value';
            isNode: String @title: 'Is Node';
            descr: String @title: 'Description';
        }
    
        aspect mA {
          key _ID:UUID @title: 'ID' @odata.Type:'Edm.String';
            __createdAt  : Timestamp @title: 'Created At' @cds.on.insert: $now;
            __createdBy  : String(255) @title: 'Created By' @cds.on.insert: $user;
            __modifiedAt : Timestamp @title: 'Modified At' @cds.on.insert: $now @cds.on.update: $now;
            __modifiedBy : String(255) @title: 'Modified By' @cds.on.insert: $user @cds.on.update: $user;
            __procId     : String @title: 'Process ID';
            __activity   : String @title: 'Activity';
        }
    
        @readonly
        entity ENV0001AL1Values as projection on ModelingService_FieldValues { key field, key value, descr } where envId = 'ENV' and ver = '0001' and isNode = false;
        @readonly
        entity ENV0001AL1Currencies as projection on ModelingService_Currencies {key code, symbol};
    
        entity ENV0001AL1: mA {
          AC: String @title: 'Account' @(Common.ValueList: { $Type : 'Common.ValueListType', CollectionPath : '__AC', Parameters : [{ $Type : 'Common.ValueListParameterInOut', LocalDataProperty : AC, ValueListProperty : 'value' }]});
          PC: String @title: 'Profit Center' @(Common.ValueList: { $Type : 'Common.ValueListType', CollectionPath : '__PC', Parameters : [{ $Type : 'Common.ValueListParameterInOut', LocalDataProperty : AC, ValueListProperty : 'value' }]});
          TC: String(3) @title: 'TC';
          AMOUNT: Decimal(23, 2) @title: 'Amount';
          _AC: Association to one ENV0001AL1Values on _AC.field = 'AC' and _AC.value = AC;
          _PC: Association to one ENV0001AL1Values on _PC.field = 'PC' and _PC.value = PC;
          _TC: Association to one ENV0001AL1Currencies on _TC.code = TC;
        };
        @path : 'service/SENV0001AL1'
        service SENV0001AL1 {
          entity Data as projection on ENV0001AL1;
          entity MasterData as projection on ENV0001AL1Values;
          entity Currencies as projection on ENV0001AL1Currencies;
        };
    
        `;
    // Create DB tables dynamically
    let sql = cds.compile(cdl).to.sql();
    if (cds.db.kind === "hana")
      sql = sql.map((f) => f.replaceAll("TIMESTAMP_TEXT", "TIMESTAMP"));
    const sqlDrops = sql
      .map((each) => {
        let [, kind, entity] =
          each.match(/^CREATE (VIEW|TABLE) "?([^\s"(]+)/im) || [];
        return `DROP ${kind} ${entity};`;
      })
      .reverse();
    for (const f of sqlDrops) {
      try {
        await cds.run(f);
      } catch (error) {
        console.error(error);
      }
    }
    for (const f of sql) {
      try {
        const s =
          cds.db.kind === "hana"
            ? f.replace("CREATE VIEW", "CREATE OR REPLACE VIEW")
            : f;
        await cds.run(s);
      } catch (error) {
        console.error(error, req);
      }
    }

    // Service part
    const csn = cds.compile(cdl).to.csn();
    const services = await cds
      .serve("SENV0001AL1")
      .from(csn)
      .in(cds.app)
      .to("fiori")
      .at("service/SENV0001AL1");
    await cds.emit("served", services);

    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

async function deactivate(req) {
  try {
    delete cds.services["SENV0001AL1"];

    return true;
  } catch (error) {
    console.error(error, req);
    return false;
  }
}

module.exports = { activate, deactivate };
