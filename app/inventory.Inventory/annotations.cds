using inventoryService as service from '../../srv/service';

annotate service.Categories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ItemSubcategory}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Category}',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Type}',
            Value : type,
        },
    ]
);
annotate service.Categories with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Type}',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Category}',
                Value : category,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Items}',
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
            $value : name,
            ![@UI.TextArrangement] : #TextOnly,
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
            Label : '{i18n>ItemId}',
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>ItemName}',
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>ItemDescription}',
        },{
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : '{i18n>ItemAvailabilityStatus}',
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
                    Descending : false,
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
            Label : '{i18n>GeneralInformation}',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Cables}',
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
            Label : '{i18n>CableId}',
        },{
            $Type : 'UI.DataField',
            Value : shielding,
            Label : '{i18n>CableShielding}',
        },
        {
            $Type : 'UI.DataField',
            Value : msrp,
            Label : '{i18n>Price}',
        },{
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : '{i18n>AvailabilityStatus}',
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
annotate service.Mixer_Parent with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformation}',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Mixers}',
            ID : 'Items',
            Target : 'mixers/@UI.LineItem#Items',
        },
    ]
);
annotate service.Mixers with @(
    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>MixerId}',
        },
        {
            $Type : 'UI.DataField',
            Value : model_name,
            Label : '{i18n>ModelName}',
        },{
            $Type : 'UI.DataField',
            Value : manufacturer_name,
            Label : '{i18n>ManufacturerName}',
        },
        {
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : '{i18n>AvailabilityStatus}',
            Criticality : aval_Status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : operating_hours,
            Label : '{i18n>OperatingHours}',
        },{
            $Type : 'UI.DataField',
            Value : serial_number,
            Label : '{i18n>SerialNumber}',
        },{
            $Type : 'UI.DataField',
            Value : faults,
            Label : '{i18n>Faults}',
        },{
            $Type : 'UI.DataField',
            Value : msrp,
            Label : '{i18n>Price}',
        },]
);
annotate service.Lamp_Parent with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformation}',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Lamps}',
            ID : 'Lamps',
            Target : 'lamps/@UI.PresentationVariant#Lamps',
        },
    ]
);
annotate service.Lamps with @(
    UI.LineItem #Lamps : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>LampId}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : model_name,
            Label : '{i18n>ModelName}',
        },{
            $Type : 'UI.DataField',
            Value : manufacturer_name,
            Label : '{i18n>ManufacturerName}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : aval_Status_status,
            Label : '{i18n>AvailabilityStatus}',
            Criticality : aval_Status.criticality,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : operating_hours,
            Label : '{i18n>OperatingHours}',
        },
        {
            $Type : 'UI.DataField',
            Value : serial_number,
            Label : '{i18n>SerialNumber}',
        },{
            $Type : 'UI.DataField',
            Value : faults,
            Label : '{i18n>Faults}',
        },{
            $Type : 'UI.DataField',
            Value : msrp,
            Label : '{i18n>Price}',
        },]
);
annotate service.Mixers with {
    aval_Status @Common.Text : {
            $value : aval_Status.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Mixers with {
    aval_Status @Common.ValueListWithFixedValues : true
};
annotate service.Lamps with {
    aval_Status @Common.Text : {
            $value : aval_Status.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Lamps with {
    aval_Status @Common.ValueListWithFixedValues : true
};
annotate service.Lamps with @(
    UI.PresentationVariant #Lamps : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#Lamps',
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
annotate service.Lamps with {
    lamp_Parent @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Lamp_Parent',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : lamp_Parent_name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Cable_Parent with {
    name @Common.Text : {
        $value : categories_name,
        ![@UI.TextArrangement] : #TextFirst,
    }
};
annotate service.Lamp_Parent with {
    name @Common.Text : {
        $value : categories_name,
        ![@UI.TextArrangement] : #TextFirst,
    }
};
annotate service.Categories with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>ItemCategory}',
        TypeNamePlural : '{i18n>ItemCategories}',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    }
);
annotate service.Lamp_Parent with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>Lamp}',
        TypeNamePlural : '{i18n>Lamps}',
        Title : {
            $Type : 'UI.DataField',
            Value : categories_name,
        },
    }
);
annotate service.Mixer_Parent with @(
    UI.HeaderInfo : {
        TypeNamePlural : '{i18n>Mixers}',
        TypeName : '{i18n>Mixer}',
        Title : {
            $Type : 'UI.DataField',
            Value : categories_name,
        },
    }
);
annotate service.Mixers with {
    mixer_Parent @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mixer_Parent',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : mixer_Parent_name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Mixer_Parent with {
    name @Common.Text : {
        $value : categories_name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Mixers with {
    mixer_Parent @Common.Text : {
            $value : mixer_Parent.categories_name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Mixer_Parent with @(
    UI.HeaderFacets : [],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories_name,
                Label : 'categories_name',
            },],
    }
);
annotate service.Mixer_Parent with @(
    UI.FieldGroup #GeneralInformation1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories.type,
                Label : '{i18n>Type}',
            },
            {
                $Type : 'UI.DataField',
                Value : categories.category,
                Label : '{i18n>Category}',
            },],
    }
);
annotate service.Lamp_Parent with @(
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories.type,
                Label : '{i18n>Type}',
            },
            {
                $Type : 'UI.DataField',
                Value : categories.category,
                Label : '{i18n>Category}',
            },],
    }
);
annotate service.Cable_Parent with @(
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories.type,
                Label : '{i18n>Type}',
            },
            {
                $Type : 'UI.DataField',
                Value : categories.category,
                Label : '{i18n>Category}',
            },],
    }
);
annotate service.Cable_Parent with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>Cable}',
        TypeNamePlural : '{i18n>Cables}',
        Title : {
            $Type : 'UI.DataField',
            Value : categories_name,
        },
    }
);
annotate service.Mixer_Parent with {
    categories @Common.Text : categories.category
};
