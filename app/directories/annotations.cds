using Service as service from '../../srv/service';

annotate service.Directories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Id,
        },
        {
            $Type : 'UI.DataField',
            Value : parent_Id,
        },
        {
            $Type : 'UI.DataField',
            Value : sequence,
        },
        {
            $Type : 'UI.DataField',
            Value : type,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
    ]
);
annotate service.Directories with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Id,
            },
            {
                $Type : 'UI.DataField',
                Value : parent_Id,
            },
            {
                $Type : 'UI.DataField',
                Value : sequence,
            },
            {
                $Type : 'UI.DataField',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Directories with @(
    UI.SelectionFields : [
        parent_Id,
    ]
);
