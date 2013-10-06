define([
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
    "dojo/_base/config",
    "dojo/_base/lang",
    "dojo/_base/fx",
    "dijit/registry",
    "dojo/parser",
    "dijit/layout/ContentPane",
    "dijit/Tooltip",
    "aurora/module"
], function(query, dom, domStyle, domClass, domConstruct, domGeometry, string, on, aspect, keys, config, lang, baseFx, registry, parser, ContentPane, Tooltip) {

	startup = function() {
//		alert("running..");
//		query(".trigger").on("click", function(event) {
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