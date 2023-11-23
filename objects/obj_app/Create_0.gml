index = 0;
focusKind = FocusKind.None;
enum FocusKind { None, App, Game }

// turbo:
turboNext = 0;

// mouse:
stickX = 0;
stickY = 0;
canMoveMouse = false;

config = new ToolConfig();
if (file_exists("config.json")) try {
	var _buf = buffer_load("config.json");
	var _str = buffer_read(_buf, buffer_string);
	buffer_delete(_buf);
	
	var _config = json_parse(_str);
	
	var _keys = variable_struct_get_names(_config);
	for (var i = 0; i < array_length(_keys); i++) {
		config[$ _keys[i]] = _config[$ _keys[i]];
	}
} catch (e) {
	show_message("Error loading config: " + e.longMessage);
}
function saveConfig() {
	var _str = json_stringify(config);
	_str = json_beautify(_str);
	var _file = file_text_open_write("config.json");
	file_text_write_string(_file, _str);
	file_text_close(_file);
}

pick_gamepad = function() {
	var _con = "Connected gamepads:";
	for (var i = 0; i < 12; i++) {
		if (!gamepad_is_connected(i)) continue;
		if (gamepad_button_check_pressed(i, gp_start)) {
			index = i;
			return i;
		}
		if (i < 4) {
			_con += " xi" + string(i + 1);
		} else {
			_con += " di" + string(i - 3);
		}
	}
	scr_draw_middle("Press Start/equivalent on a gamepad that you'd like to use", _con);
	return undefined;
}
pick_button = function() {
	for (var i = 0; i < 16; i++) {
		var b = /*#cast*/ ((/*#cast*/ gp_face1 /*#as int*/) + i) /*#as gamepad_button*/;
		if (gamepad_button_check(index, b)) return b;
	}
	scr_draw_middle(sfmt("Press the gamepad button that you'd like to use for \"%\"",modal_name))
}
pick_key = function() /*=>*/ {
	if (keyboard_check_pressed(vk_anykey)) return keyboard_lastkey;
	scr_draw_middle(sfmt("Press the key that you'd like to use for \"%\"",modal_name));
	return undefined;
}
start_input = function(v) /*=>*/ {
	keyboard_string = string(v);
}
pick_number = function() {
	scr_draw_middle(sfmt("Enter a new number for \"%\" and press Enter",modal_name), keyboard_string);
	if (keyboard_check_pressed(vk_enter)) {
		var s = string_replace_all(keyboard_string, ",", ".");
		var v;
		try {
			v = json_parse(s);
			if (!is_numeric(v)) v = undefined;
		} catch (e) {
			v = undefined;
		}
		if (v == undefined) {
			show_message(sfmt("\"%\" is not a valid number",s));
		} else return v;
	}
	if (keyboard_check_pressed(vk_escape)) {
		return config[$ modal_key];
	}
	return undefined;
}
toggle_bool = function(v) /*=>*/ {
	return !v;
}
onoff = function(v) /*=>*/ {return v ? "On" : "Off"};
modal = pick_gamepad;
modal_key = "";
modal_name = "";
controls = [
	{
		label: "Gamepad",
		key: "",
		modal: pick_gamepad,
		value: function(v) /*=>*/ {return "#" + string(v + 1)},
	},
	"Turbo key (for skipping dialogs)",
	{
		label: "Gamepad button",
		key: "turboButton",
		modal: pick_button,
		value: gamepad_button_name,
	},
	{
		label: "Keyboard key",
		key: "turboKey",
		modal: pick_key,
		value: keyboard_key_name,
	},
	{
		label: "Repeat rate",
		key: "turboRate",
		trigger: start_input,
		modal: pick_number,
		value: function(v) /*=>*/ {return sfmt("%/s",v)},
	},
	{
		label: "Hold time",
		key: "turboHold",
		note: "Lower values might not register",
		trigger: start_input,
		modal: pick_number,
		value: function(v) /*=>*/ {return sfmt("%ms", v)},
	},
	"Move cursor with gamepad (for Claw blessing)",
	{
		label: "Enable",
		note: "You can also test it in this window",
		key: "useMouse",
		trigger: toggle_bool,
		value: onoff,
	},
	{
		label: "Deadzone",
		note: "Enables when moving stick this far, disables on window focus loss",
		key: "mouseDeadzone",
		trigger: start_input,
		modal: pick_number,
		value: function(v) /*=>*/ {return string(v) + "%"},
	},
	{
		label: "Cursor stick",
		key: "mouseStick",
		trigger: toggle_bool,
		value: function(v) /*=>*/ {return v ? "Right" : "Left"},
	},
	{
		label: "D-pad",
		note: "Higher-precision; hold d-pad to reach for corners",
		key: "mouseDpad",
		trigger: toggle_bool,
		value: onoff,
	},
	{
		label: "Click button",
		key: "mouseButton",
		modal: pick_button,
		value: gamepad_button_name,
	},
];
my_caption = window_get_caption();

gamepad_force_focus();
display_set_gui_maximize();