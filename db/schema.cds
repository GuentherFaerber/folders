type DirectoryType @(assert.range) : String @title : 'Type' enum {
    Folder = 'FOLDER';
    File   = 'FILE'
}

@odata.draft.enabled
entity Directories {
    key Id          : String  @title : 'ID';
        parentId    : String  @title : 'Parent ID';
        sequence    : Integer @title : 'Sequence';
        type        : DirectoryType;
        description : String  @title : 'Description';
        _parentId   : Association to one Directories
                          on _parentId.Id = parentId;
}
