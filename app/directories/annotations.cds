using Service as service from '../../srv/service';

annotate service.Directories with @(
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
            $Type: 'UI.DataFieldWithIntentBasedNavigation',
            Value : parent_Id,
            SemanticObject: 'NavDirectories',
            Action: 'display',
            Label : 'Browse Childs',
        },
        {
            $Type : 'UI.DataField',
            Value : type,
        },
        {
            $Type : 'UI.DataField',
            Value : sequence,
        },
    ]
);
