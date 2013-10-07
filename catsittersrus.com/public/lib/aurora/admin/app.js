define([
    "dojo/request/xhr",
    "dojo/query",
    "dojo/dom",
    "dojo/dom-style",
    "dojo/dom-class",
    "dojo/dom-construct",
    "dojo/dom-geometry",
    "dojox/form/Manager",
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
    "aurora/admin/module",
    "dijit/form/Form",
    "dijit/form/TextBox",
    "dijit/form/Button",
    "dijit/form/SimpleTextarea",
    "ckeditor/ckeditor"
], function(xhr, query, dom, domStyle, domClass, domConstruct, domGeometry, formManager, string, on, aspect, keys, config, lang, baseFx, registry, parser, ContentPane, Tooltip, ckeditor) {

	createTab = function (location, itemTitle) {
		var contr = registry.byId("tabs");
		// create the new tab panel for this search
		var panel = new ContentPane({
			title: itemTitle,
			href: location,
			parseOnLoad: true,
			closable: true
		});
		
//		var tabContent = xhr.get(location, {
//		    handleAs: "text"
//		  }).then(function(data){
//         	 panel.set("content", data);
////         	 ckeditor = new CKEditor();
////         	 ckeditor.replace("pageText");
//		  });
		  
		
//		contr.addChild(panel);
//		// make this tab selected
//		contr.selectChild(panel);
	},
	createPanel = function(location, paneTitle) {
		var pane = dijit.byId("wSO");
		pane.set("href", location);
	}
	startup = function() {

		query(".navigation a").on("click", function(event) {
			event.preventDefault();
			var title = event.target.title;
			var href = event.target.href;
			createPanel(href, title);
			//alert("Load Image");
		});
		
//		query("").on("click", function(event) {
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