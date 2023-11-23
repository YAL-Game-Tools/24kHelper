// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_middle(_top, _bot = undefined){
	draw_set_halign(fa_center);
	var _x = display_get_gui_width() div 2;
	var _y = display_get_gui_height() div 2;
	if (_bot == undefined) {
		draw_set_valign(fa_middle);
		draw_text(_x, _y, _top);
		draw_set_valign(fa_top);
	} else {
		draw_set_valign(fa_bottom);
		draw_text(_x, _y, _top);
		draw_set_valign(fa_top);
		draw_text(_x, _y, _bot);
	}
	draw_set_halign(fa_left);
}