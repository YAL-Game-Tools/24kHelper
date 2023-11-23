function gamepad_button_name(b) {
	return global.gamepad_button_to_name[?b] ?? sfmt("Mystery button (%)",b);
}
(function() {
	var m = ds_map_create();
	m[? gp_face1] = "Button 1";
	m[? gp_face2] = "Button 2";
	m[? gp_face3] = "Button 3";
	m[? gp_face4] = "Button 4";
	m[? gp_shoulderr] = "Right Bumper";
	m[? gp_shoulderrb] = "Right Trigger";
	m[? gp_shoulderl] = "Left Bumper";
	m[? gp_shoulderlb] = "Left Trigger";
	m[? gp_stickl] = "Left Stick";
	m[? gp_stickr] = "Right Stick";
	m[? gp_start] = "Start";
	m[? gp_select] = "Select";
	m[? gp_padl] = "Dpad Left";
	m[? gp_padr] = "Dpad Right";
	m[? gp_padu] = "Dpad Up";
	m[? gp_padd] = "Dpad Down";
	global.gamepad_button_to_name = m;
})();
