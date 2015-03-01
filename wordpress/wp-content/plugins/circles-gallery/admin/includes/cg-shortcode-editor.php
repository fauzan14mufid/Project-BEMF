<?php global $wp_version, $wpdb, $wp_post_types; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Circles Gallery shortcode editor</title>
		<!--<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>-->
		<script>
		var wpColorPickerL10n = {"clear":"Clear","defaultString":"Default","pick":"Select Color","current":"Current Color"};
		</script>
		<script type="text/javascript" src="<?php print $admin_url ?>/load-scripts.php?c=1&load%5B%5D=jquery-core,jquery-migrate,utils,jquery-ui-core,jquery-ui-widget,jquery-ui-mouse,jquery-ui-draggable,jquery-ui-slider,jquery-tou&load%5B%5D=ch-punch,iris,wp-color-picker"></script>
		<link rel="stylesheet" href="<?php print admin_url( 'load-styles.php?c=1&dir=ltr&load=buttons,wp-admin,iris,wp-color-picker'); ?>" type="text/css" media="all">			
		<link rel="stylesheet" href="<?php print $css_path ?>">
		<script language="javascript" type="text/javascript" src="<?php echo includes_url( 'js/tinymce/tiny_mce_popup.js' ).'?ver='.$wp_version; ?>"></script> 	
		<style type="text/css">
			body {
				overflow-y:scroll;
				padding: 0 20px 60px 20px;
				height: auto;
			}
			#bottom {
				position: fixed;
				bottom:0;
				height: 50px;
				background: #fff;
				border-top: 3px solid #666;
				width: 100%;
				left:0;
			}
			.inner {
				margin:5px;
			}
			#bottom .inner button {
				width: 29%;
			}
			#bottom .inner input {
				width: 70%;
				border-color:#666; 				
			}			
			#bottom .inner button,
			#bottom .inner input {
				height: 40px;
				font-size: 14px;
			}
			#shedit {
				border-bottom: 3px solid #666;
				margin-bottom: 10px;
				padding: 10px 0;
				font-size: 14px;
			}
			#shedit input {
				width: 70%;
			}
			.form-table td {
				padding: 5px 10px;
			}
			.form-table .help {
				font-size: 10px;
			}
			#shedit label {
				font-size: 14px;
				font-weight: bold;
			}
			#input {
				border-radius: 4px;
				border: 1px solid #333;
				padding: 5px;
				background: #fff;
			}
			h3 span {
				font-size: 11px;
				font-weight: normal;
				display: inline-block;
				margin-left: 10px;
			}
			#submitButton {
				display: none;
			}
			#help a {
				font-weight: bold;
				text-decoration: none;
			}
			#help a:hover {
				font-weight: bold;
				text-decoration: underline;
			}
		</style>
	</head>
	<body class="popup">
		<div id="shedit">
				<label>Enter shortcode to edit</label>
				<input type="text" id="input" />
		</div>
		<div id="help">
			<p>Need help? <a href="http://circles-gallery.com/wordpress/tutorial/" target="_blank">Read the tutorial.</a></p>
		</div>
		
		<?php $this->include_options(true) ?>
		<div id="bottom">
			<div class="inner">			
				<button id="genshcode">Generate shortcode</button>
				<input type="text" id="output" />
			</div>
		</div>
		<script>
		(function ($) {
			$("form").find("input[type=text], select").val("");
			$("form").find("textarea").parents("tr:first").remove();
			
			$("form > h3").append("<span>All values are inherited from the settings, fill fields you want to overwrite.</span>");
			
			$("#genshcode").click(function () {
				var shortcode = "circles_gallery $options";				
				
				var options = [];
				var re = new RegExp(/circles-gallery-options\[(.+)\]/);
				$("form").find("input[type=text], select, .shortcode-field").each(function () {
					var name = $(this).attr("name").match(re)[1];
					if($.trim($(this).val()))
						options.push(name + "=\""+ $(this).val() + "\"");
				});
				var replaced = $.trim(shortcode.replace("$options", options.join(' ')));
				$("#output")
					.val('[' + replaced +']')
					.get(0).select();
			});
			$("#input").keyup(function() {
				var data = $(this).val().replace(/(\[|\])/g, "").split(" ");			
				
				for(var i=0; i<data.length; i++) {
					var item = data[i].split('=');
					if(item.length > 1) {
						$("#" + item[0]).val(item[1].replace(/"/g, ""));
						if($("#" + item[0]).hasClass("color-field")) {
							$("#" + item[0]).wpColorPicker("color", item[1].replace(/"/g, ""));
						}
					}
				}
			});
			})(jQuery);
		</script>
	</body>
</html>
