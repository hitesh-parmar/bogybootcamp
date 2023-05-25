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
            Label : 'Items',
            ID : 'Items',
            Target : 'generic_items/@UI.PresentationVariant#Items',
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
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'description',
        },
        {
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : 'aval_Status_status',
        },]
);
annotate service.Generic_Items with {
    aval_Status @Common.Text : {
            $value : aval_Status.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Generic_Items with {
    aval_Status @Common.ValueListWithFixedValues : true
};
annotate service.Aval_Status with {
    status @Common.Text : {
            $value : descr,
            ![@UI.TextArrangement] : #TextFirst,
        }
};
annotate service.Generic_Items with @(
    UI.PresentationVariant #ListofItems : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#ListofItems',
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : aval_Status_status,
                Descending : false,
            },
        ],
    }
);
annotate service.Generic_Items with @(
    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Item ID',
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Item Name',
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Item Description',
        },{
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : 'Item Availability Status',
            Criticality : aval_Status.criticality,
        },]
);
annotate service.Categories with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : category,
                    Descending : true,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);
annotate service.Cables with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'sad',
            ID : 'sad',
            Target : '@UI.FieldGroup#sad',
        },],
    UI.FieldGroup #wd : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : shielding,
                Label : 'shielding',
            },],
    }
);
annotate service.Generic_Items with @(
    UI.PresentationVariant #Items : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#Items',
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : aval_Status_status,
                Descending : false,
            },
        ],
    }
);
annotate service.Cables with @(
    UI.FieldGroup #sad : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : aval_Status_status,
                Label : 'aval_Status_status',
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },],
    }
);
annotate service.Cable_Parent with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Cables',
            ID : 'Cables',
            Target : 'cables/@UI.PresentationVariant#Cables',
        },
    ]
);
annotate service.Cables with @(
    UI.LineItem #Cables : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Cable ID',
        },{
            $Type : 'UI.DataField',
            Value : cable_Parent_name,
            Label : 'Cable Type',
        },
        {
            $Type : 'UI.DataField',
            Value : shielding,
            Label : 'Cable Shielding',
        },{
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Cable Price',
        },{
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : 'Availability Status',
            Criticality : aval_Status.criticality,
        },]
);
annotate service.Cables with {
    aval_Status @Common.ValueListWithFixedValues : true
};
annotate service.Cables with @(
    UI.PresentationVariant #Cables : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#Cables',
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : aval_Status_status,
                Descending : false,
            },
        ],
    }
);
annotate service.Cables with {
    aval_Status @Common.Text : {
            $value : aval_Status.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Cables with {
    price @Measures.ISOCurrency : ''
};
