var focus = window_has_focus();
draw_enable_drawevent(focus);

var _focus_kind = focusKind;
var _active_title = window_get_active_title();
if (_active_title == my_caption) {
	focusKind = FocusKind.App;
} else if (_active_title == "24 Killers") {
	focusKind = FocusKind.Game;
} else {
	focusKind = FocusKind.None;
}

// 
if (_focus_kind != focusKind) {
	canMoveMouse = false;
}
if (focusKind == FocusKind.None) exit;

var _rect = window_get_active_rect();
var wx = _rect[0];
var wy = _rect[1];
var ww = _rect[2];
var wh = _rect[3];
var cx = wx + ww / 2;
var cy = wy + wh / 2;
//show_debug_message([cx,cy,cr]);
var rstick = config.mouseStick != 0;
var gx = gamepad_axis_value(index, rstick ? gp_axisrh : gp_axislh);
var gy = gamepad_axis_value(index, rstick ? gp_axisrv : gp_axislv);
var hx = 0, hy = 0;
if (config.mouseDpad) {
	hx = gamepad_button_check(index, gp_padr) - gamepad_button_check(index, gp_padl);
	hy = gamepad_button_check(index, gp_padd) - gamepad_button_check(index, gp_padu);
}
var old_stick_x = stickX;
var old_stick_y = stickY;
stickX = gx + hx;
stickY = gy + hy;
if (!canMoveMouse && (
	point_distance(0, 0, stickX, stickY) > config.mouseDeadzone/100
)) canMoveMouse = true;

if (gamepad_button_check(index, config.turboButton)) {
	if (current_time >= turboNext) {
		keyboard_key_press(config.turboKey);
		display_sim_sleep_pm(config.turboHold);
		keyboard_key_release(config.turboKey);
		turboNext = current_time + 1000 / max(1, config.turboRate);
	}
}

if (canMoveMouse && (stickX != old_stick_x || stickY != old_stick_y)) {
	var cr;
	if (config.mouseDpad) {
		cr = min(ww, wh) / 2;
	} else {
		cr = max(ww, wh) / 2;
	}
	var mx = clamp(cx + (gx + hx) * cr, wx + 1, wx + ww - 1);
	var my = clamp(cy + (gy + hy) * cr, wy + 1, wy + wh - 1);
	//show_debug_message([cx,cy,cr,mx,my]);
	display_mouse_set_alt(mx, my);
}

//
var b = config.mouseButton;
if (gamepad_button_check_pressed(index, b)) display_mouse_button_press(mb_left);
if (gamepad_button_check_released(index, b)) display_mouse_button_release(mb_left);