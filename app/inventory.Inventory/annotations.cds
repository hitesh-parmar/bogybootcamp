using inventoryService as service from '../../srv/service';

annotate service.Categories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'type',
            Value : type,
        },
        {
            $Type : 'UI.DataField',
            Label : 'category',
            Value : category,
        },
    ]
);
annotate service.Categories with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'type',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
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
            Label : 'List of Items',
            ID : 'ListofItems',
            Target : 'generic_items/@UI.LineItem#ListofItems',
        },
    ]
);

annotate service.Generic_Items with @(
    UI.LineItem #ListofItems : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },{
            $Type : 'UI.DataField',
            Value : items_ID,
            Label : 'items_ID',
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : 'description',
        },]
);
