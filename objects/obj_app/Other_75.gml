if (async_load[?"event_type"] == "gamepad discovered") {
	index = async_load[?"pad_index"];
	show_debug_message("Using gamepad " + string(index));
}