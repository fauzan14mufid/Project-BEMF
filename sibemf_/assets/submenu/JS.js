function fadeIn($elts) {
  $elts.each(function() {
    var $this = $(this);
    if ($this.css('opacity') == 0 || !$this.is(':visible'))
      $this.fadeIn('slow');
  });
}

// Download Button
$(document).ready(function(){	
	$('#download-info').fadeOut(100);
});

$(".download-btns").hover(function(){
  $(".download-text").css('display', 'none');
  fadeIn($(".win-btn-wrapper, a.mac-btn, #download-info"));
},
function(){
    $("#download-info").fadeOut(100);
});

// Store button
$(".store-btn").hover(function(){
  fadeIn($("#shop-info"));
},
function(){
    $("#shop-info").fadeOut(100);
});

// Window bit button
$(".win-btn-wrapper").hover(function(){
  fadeIn($(".windows-bit"));
},
function(){
    $(".windows-bit").fadeOut(100);
});
