using Service as service from '../../srv/service';
using from '../../db/schema';

annotate service.Directories with @(
    UI.LineItem : [
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Functions',
            ID : 'Functions',
            Target : 'functions/@UI.LineItem#Functions',
        },
    ]
);
annotate service.Functions with @(
    UI.LineItem #Functions : [
        {
            $Type : 'UI.DataField',
            Value : description,
        },{
            $Type : 'UI.DataField',
            Value : type,
        },]
);
annotate service.Functions with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : description,
            },{
                $Type : 'UI.DataField',
                Value : type,
            },],
    }
);
