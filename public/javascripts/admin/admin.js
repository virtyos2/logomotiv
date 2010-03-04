function menu_show(el, id, type) {
	if(!type) type="page";
	$.get("/admin/pages/context_menu/"+id+"?type="+type, function(result) {
		$(".context-menu").html(result);
	});
	$(".context-menu").hide().show("slow").css("top", $(el).offset().top - 50).css("left", $(el).offset().left+50);
}

function menu_hide() {
	$(".context-menu").hide("slow");
}

$('.list li.child').live("mouseover", function() {
	$(this).find('img').attr('src', '/images/edit_over.gif')
});

$('.list li.child').live("mouseout", function() {
	$(this).find('img').attr('src', '/images/admin/pen_img.png')
});