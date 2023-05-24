namespace inventory;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Items
{
    key ID : UUID
        @Core.Computed;
    name : String(100);
    type : String(100) not null;
    category : String(100);
    mixers : Composition of many Mixers on mixers.items = $self;
    cables : Composition of many Cables on cables.items = $self;
    generic_items : Composition of many generic_items on generic_items.items = $self;
}

entity Cables
{
    key ID : UUID
        @Core.Computed;
    shielding : String(100);
    price : Decimal(5,2) not null;
    items : Association to one Items;
}

entity Lamps
{
    key ID : UUID
        @Core.Computed;
}

entity Mixers
{
    key ID : UUID
        @Core.Computed;
    operating_hours : Integer;
    serial_number : String(100);
    model_name : String(100) not null;
    manufacturer_name : String(100) not null;
    faults : String(100);
    msrp : Decimal(7,2);
    items : Association to one Items;
}

entity Adapters
{
    key ID : UUID
        @Core.Computed;
}

type Status : String enum
{
    A = 'Available';
    B = 'Broken';
    U = 'In Use';
}

entity generic_items
{
    key ID : UUID
        @Core.Computed;
    name : String(100) not null;
    description : String(1000);
    items : Association to one Items;
}
