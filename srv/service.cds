using { inventory as my } from '../db/schema';

using inventory from '../db/schema';

service bogybootcampService
{
}

@path : 'service/inventory'
service inventoryService
{
    entity Cables as
        projection on my.Cables;

    entity Mixers as
        projection on my.Mixers;

    entity Generic_Items as
        projection on my.Generic_Items;

    entity Aval_Status as
        projection on my.Aval_Status;

    @odata.draft.enabled
    entity Categories as
        projection on my.Categories;

}

annotate inventoryService with @requires :
[
    'authenticated-user'
];
