draw_set_font(fnt_nice);
if (modal != undefined) {
	var _result = modal();
	if (_result != undefined) {
		modal = undefined;
		if (modal_key != "") {
			config[$ modal_key] = _result;
			saveConfig();
		}
	}
	exit;
}

#region params
var marginLeft = 5;
var marginHor = 10;
var marginTop = 5;
var marginHeaderStart = 5;
var marginHeaderEnd = 3;
var marginLineEnd = 3;
#endregion

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var guiWidth = display_get_gui_width() - 20;
var n = array_length(controls);
var h = string_height("Q");
draw_set_font(fnt_header);
var headerHeight = string_height("Q");
draw_set_font(fnt_nice);
var w1 = 0, w2 = 0;
var t = marginTop;
for (var i = 0; i < n; i++) {
	var _control = controls[i];
	if (is_string(_control)) {
		t += marginHeaderStart;
		draw_set_font(fnt_header);
		draw_text(5+10, t, _control);
		t += headerHeight;
		draw_sprite_stretched_ext(spr_white,0, 5,t, guiWidth - 10,1, c_white,1);;
		draw_set_font(fnt_nice);
		t += marginHeaderEnd;
		continue;
	}
	
	var s = _control.label;
	if (is_method(s)) s = s(config[$ controls[i].key]);
	
	var val/*:any*/ = _control.key != "" ? config[$ _control.key] : index;
	var vf = _control[$ "value"];
	if (vf != undefined) val = vf(val);
	if (!is_string(val)) val = string(val);
	_control.str = val;
	
	draw_text(marginLeft, t, s);
	w1 = max(w1, string_width(s));
	w2 = max(w2, string_width(val));
	t += h + marginLineEnd;
}
t = marginTop;
w2 += 10;

var _interact = undefined;
for (var i = 0; i < n; i++) {
	var _control = controls[i];
	if (is_string(_control)) {
		t += headerHeight + marginHeaderStart + marginHeaderEnd;
		continue;
	}
	var over = point_in_rectangle(mx, my, 10 + w1, t, 10 + w1 + w2, t + h);
	var a = over ? 0.3 : 0.1;
	if (over && mouse_check_button_pressed(mb_left)) _interact = _control;
	draw_sprite_stretched_ext(spr_white,0, marginLeft + marginHor + w1, t, w2, h, c_white, a);
	draw_set_halign(fa_center);
	draw_text(marginLeft + marginHor + w1 + w2 div 2, t, _control.str);
	draw_set_halign(fa_left);
	var _note = _control[$ "note"];
	if (_note != undefined) draw_text(marginLeft + marginHor * 2 + w1 + w2, t, _note);
	t += h + marginLineEnd;
}
if (_interact != undefined) {
	//trace(_interact)
	modal_key = _interact.key;
	modal_name = _interact.label;
	var _trigger = _interact[$ "trigger"];
	if (_trigger != undefined) {
		var _curr = config[$ _interact.key];
		var _next = _trigger(_curr);
		if (_next != undefined) {
			config[$ _interact.key] = _next;
			saveConfig();
		}
	}
	
	var _modal = _interact[$ "modal"];
	if (_modal != undefined) {
		modal = _modal;
	}
}