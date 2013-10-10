define([
"dijit/registry",
"dojo/_base/array",
    "dojo/query",
    "dojo/dom",
    "dojo/dom-style",
    "dojo/dom-class",
    "dojo/dom-construct",
    "dojo/dom-geometry",
    "dojo/string",
    "dojo/on",
    "dojo/aspect",
    "dojo/keys",
    
    "dojo/parser",
    "dijit/form/NumberSpinner",
    "dijit/form/Form",
    "aurora/module"
], function(registry, arrayUtil, query, dom, domStyle, domClass, domConstruct, domGeometry, string, on, aspect, keys, config, lang, baseFx, parser, ContentPane, Tooltip) {

	getTotal = function() {
		var totalNode = dom.byId("total");
		var total = Number(totalNode.innerHTML);
		console.log(total);
	},
	addToTotal = function(amt) {
		console.log(amt);
	}, 
	setTotal = function(newTotal) {
		
	},
	startup = function() {
		getTotal();
		var orderForm = registry.byId("orderForm");
		
		console.log(orderForm.getChildren());
		
		//alert("running..");
//		query(".count").watch("click", function(event) {
//			event.preventDefault();
//			var title = event.target.title;
//			var href = event.target.href;
//			createTab(href, title);
//			//alert("Load Image");
//		});
	};
	return {
		init: function() {
			startup();
		}
	};
});