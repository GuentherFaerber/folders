using FunctionService as service from '../../srv/functions-service';

annotate service.Allocations with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : function_ID,
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'General Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate service.Allocations with {
    function @(
        Common.ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'Functions',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : function_ID,
                ValueListProperty : 'ID',
            }, ],
        },
        Common.ValueListWithFixedValues : true
    )
};

annotate service.Functions with {
    ID @Common.Text : description
};
