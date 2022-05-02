using Service as service from '../../srv/service';

annotate service.Environments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Id,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : parentId,
        },
        {
            $Type : 'UI.DataField',
            Value : sequence,
        },
    ]
);
annotate service.Environments with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Id,
            },
            {
                $Type : 'UI.DataField',
                Value : parentId,
            },
            {
                $Type : 'UI.DataField',
                Value : sequence,
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
annotate service.Environments with @(
    UI.SelectionFields : [
        parentId,
    ]
);
