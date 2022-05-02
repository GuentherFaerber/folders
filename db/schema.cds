@odata.draft.enabled
entity Environments {
    key Id          : String  @title : 'ID';
        parentId    : String  @title : 'Parent ID';
        sequence    : Integer @title : 'Sequence';
        description : String  @title : 'Description';
        _parentId   : Association to one Environments
                          on _parentId.Id = parentId;
}
