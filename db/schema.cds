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
    generic_items : Composition of many Generic_Items on generic_items.category = $self;
    cable_Parent : Association to many Cable_Parent on cable_Parent.categories = $self;
    mixer_Parent : Association to many Mixer_Parent on mixer_Parent.categories = $self;
    lamp_Parent : Association to many Lamp_Parent on lamp_Parent.categories = $self;
}

entity Cables
{
    key ID : UUID
        @Core.Computed;
    shielding : String(100);
    msrp : Decimal(5,2) not null;
    aval_Status : Association to one Aval_Status;
    cable_Parent : Association to one Cable_Parent;
}

entity Lamps
{
    key ID : UUID
        @Core.Computed;
    lamp_Parent : Association to one Lamp_Parent;
    operating_hours : Integer;
    serial_number : String(100);
    model_name : String(100) not null;
    manufacturer_name : String(100) not null;
    faults : String(100);
    msrp : String(100);
    description : String(100);
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
    mixer_Parent : Association to one Mixer_Parent;
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

entity Cable_Parent
{
    key name : String;
    categories : Association to one Categories;
    cables : Composition of many Cables on cables.cable_Parent = $self;
}

entity Mixer_Parent
{
    key name : String;
    mixers : Composition of many Mixers on mixers.mixer_Parent = $self;
    categories : Association to one Categories;
}

entity Lamp_Parent
{
    key name : String;
    lamps : Composition of many Lamps on lamps.lamp_Parent = $self;
    categories : Association to one Categories;
}
