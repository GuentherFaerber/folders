@odata.draft.enabled
@cds.odata.valuelist
entity Directories {
    key ID          : UUID                           @odata.Type : 'Edm.String'  @UI.Hidden;
        parent      : Association to one Directories @title      : 'Parent ID';
        sequence    : Integer                        @title      : 'Sequence';
        type        : DirectoryType;
        description : String                         @title      : 'Description';
        childs      : Association to many Directories
                          on parent = $self;
        functions   : Composition of many Functions
                          on functions.directory = $self;
}

type DirectoryType @(assert.range) : String @title : 'Type' enum {
    Folder = 'FOLDER';
    File   = 'FILE'
}


entity Functions {
    key ID            : UUID        @odata.Type : 'Edm.String'  @UI.Hidden;
        type          : FileType;
        description   : String      @title      : 'Description';
        documentation : LargeString @title      : 'Documentation';
        sequence      : Integer;
        directory     : Association to one Directories;
        allocation    : Association to one Allocations;
        derivation    : Association to one Derivations;
        modelTable    : Association to one ModelTables;
}

type FileType @(assert.range) : String @title : 'Type' enum {
    Allocation = 'AL';
    Derivation = 'DE';
    ModelTable = 'MT';
}

entity Allocations {
    key ID          : UUID                         @odata.Type : 'Edm.String'  @UI.Hidden;
        type        : AllocationType;
        description : String                       @title      : 'Description'  @assert.format : '[A-Z,0-9,_]{3}';
        function    : Association to one Functions @mandatory  @title                          : 'Function';
}

type AllocationType @(assert.range) : String @title : 'Type' enum {
    Direct   = 'DI';
    Indirect = 'IN';
}

entity Derivations {
    key ID          : UUID                         @odata.Type :        'Edm.String'  @UI.Hidden;
        type        : DerivationType;
        description : String                       @title      :        'Description';
        function    : Association to one Functions @mandatory  @title : 'Function';
}

type DerivationType @(assert.range) : String @title : 'Type' enum {
    Derivation        = 'DE';
    TransferStructure = 'TR';
}

entity ModelTables {
    key ID          : UUID                         @odata.Type :        'Edm.String'  @UI.Hidden;
        type        : ModelTableType;
        description : String                       @title      :        'Description';
        function    : Association to one Functions @mandatory  @title : 'Function';
}

type ModelTableType @(assert.range) : String @title : 'Type' enum {
    Internal = 'IN';
    External = 'EX';
}

@cds.odata.valuelist
entity DirectoriesVH as select 
        key ID as id,    
        parent,      
        sequence,    
        type,      
        description 
        from Directories
;
