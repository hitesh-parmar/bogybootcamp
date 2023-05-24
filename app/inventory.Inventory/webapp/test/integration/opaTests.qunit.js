sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'inventory/Inventory/test/integration/FirstJourney',
		'inventory/Inventory/test/integration/pages/ItemsList',
		'inventory/Inventory/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ItemsList, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('inventory/Inventory') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheItemsList: ItemsList,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);