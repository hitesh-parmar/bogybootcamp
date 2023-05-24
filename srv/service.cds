using { inventory as my } from '../db/schema';

using inventory from '../db/schema';

service bogybootcampService
{
}

@path : 'service/inventory'
service inventoryService
{
    @odata.draft.enabled
    entity Items as
        projection on my.Items;

    entity Cables as
        projection on my.Cables;

    entity Mixers as
        projection on my.Mixers;

    entity generic_items as
        projection on my.generic_items;
}

annotate inventoryService with @requires :
[
    'authenticated-user'
];
