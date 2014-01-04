
function switchMenu(item) {
	$(".user_list .curr").removeClass('curr');
	item.addClass('curr');
	$("#curr_mnu").html(item.text());
}