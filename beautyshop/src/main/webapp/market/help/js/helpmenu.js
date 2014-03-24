function switchMenu(item) {
	$(".user_list .curr").removeClass('curr');
	item.addClass('curr');
	$("#sec_mnu").html("帮助中心");
	$("#curr_mnu").html(item.text());
}