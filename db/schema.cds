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
    temporal,
    sap.common.CodeList
}
from '@sap/cds/common';

annotate Aval_Status
{
    name;
    descr;
}

entity Categories
{
    key name : String(100);
    type : String(100) not null;
    category : String(100) not null;
    mixers : Composition of many Mixers on mixers.category = $self;
    cables : Composition of many Cables on cables.category = $self;
    generic_items : Composition of many Generic_Items on generic_items.category = $self;
}

entity Cables
{
    key ID : UUID
        @Core.Computed;
    shielding : String(100);
    price : Decimal(5,2) not null;
    aval_Status : Association to one Aval_Status;
    category : Association to one Categories;
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
    aval_Status : Association to one Aval_Status;
    category : Association to one Categories;
}

entity Adapters
{
    key ID : UUID
        @Core.Computed;
}

entity Generic_Items
{
    key ID : UUID
        @Core.Computed;
    name : String(100) not null;
    description : String(1000);
    aval_Status : Association to one Aval_Status;
    category : Association to one Categories;
}

entity Aval_Status : CodeList
{
    key status : String enum
    {
        Available = 'A';
        In_Use = 'U';
        Broken = 'B';
    } default 'A';
    criticality : Integer;
}

