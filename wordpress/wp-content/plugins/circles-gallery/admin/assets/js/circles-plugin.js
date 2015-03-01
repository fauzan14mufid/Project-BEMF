(function() {
	tinymce.create('tinymce.plugins.CirclesGallery', {
		init : function(ed, url)
		{
			ed.addCommand('cg_shortcode_editor_button', function()
			{
				ed.windowManager.open(
				{
					file: ajaxurl + '?action=cg_shortcode_editor',
					width : 900 + parseInt(ed.getLang('button.delta_width', 0)),
					height : 500 + parseInt(ed.getLang('button.delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url
				});
			});
			
			ed.addButton('cg_shortcode_editor', {title : 'Circles Gallery shortcode editor', cmd : 'cg_shortcode_editor_button', image: url.substring(0,url.lastIndexOf("/js")) + '/img/icon.png' });
		},	 
		getInfo : function()
		{
			return {
				longname : 'Circles Gallery shortcode editor',
				author : 'GreenTreeLabs',
				authorurl : 'http://greentreelabs.net',
				infourl : 'http://greentreelabs.net',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});
	tinymce.PluginManager.add('cg_shortcode_editor', tinymce.plugins.CirclesGallery);
})();