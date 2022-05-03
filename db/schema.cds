type DirectoryType @(assert.range) : String @title : 'Type' enum {
    Folder = 'FOLDER';
    File   = 'FILE'
}

@odata.draft.enabled
entity Directories {
    key Id          : String                         @title : 'ID';
        parent      : Association to one Directories @title : 'Parent ID';
        sequence    : Integer                        @title : 'Sequence';
        type        : DirectoryType;
        description : String                         @title : 'Description';
        Childs      : Association to many Directories
                          on parent = $self;
}
