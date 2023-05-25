sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('inventory.Inventory.ext.controller.Navigation', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {

			routing: {
                onBeforeNavigation: function(oContextInfo) {
                    var oLineContextData = oContextInfo.sourceBindingContext,
                        oNav = this.base.getExtensionAPI().intentBasedNavigation,
                        oRouting = this.base.getExtensionAPI().routing;
                    // for salesOrder 2919431 navigate to CustomMaterialDetailsPage
                    if (oLineContextData.category === "Cable") {
                        oRouting.navigateToRoute("CablesObjectPage", {
							"key": "name='" + oLineContextData.name.replace(/ /g, "_") + "'" 
                        });
                    } else {
                        // return false to trigger the default internal navigation
                        return false;
                    }
                    // return true is necessary to prevent further default navigation
                    return true;
                }
            },

			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf inventory.Inventory.ext.controller.Navigation
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			}
		}
	});
});
