using {
    Directories as directories,
    Allocations as allocations,
    Derivations as derivations,
    ModelTables as modelTables,
    Functions   as functions,
} from '../db/schema';

@path : 'service/directories'
service Service {
    @odata.draft.enabled
    entity Directories as projection on directories order by
        sequence asc;
}

@path : 'service/functions'
service FunctionService {
    @odata.draft.enabled
     entity Functions  as select from functions {
        key ID,
        type,  
        description, 
        documentation,
        sequence,
        allocation,
        derivation, 
        modelTable,
        (case when type = 'AL' then false else true end) as hideField: Boolean
    } actions {
        @title : 'Activate'
        action activate();
        @title : 'Deactivate'
        action deactivate();
    };

    @odata.draft.enabled
    entity Allocations as projection on allocations;

    @odata.draft.enabled
    entity Derivations as projection on derivations;

    @odata.draft.enabled
    entity ModelTables as projection on modelTables;
}
