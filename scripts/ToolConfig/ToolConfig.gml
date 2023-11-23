function ToolConfig() constructor {
	index = 0;
	
	// turbo:
	turboKey = ord("X");
	turboButton = gp_shoulderl;
	turboRate = 15;
	turboHold = 30;
	
	// mouse:
	useMouse = true;
	mouseDeadzone = 10;
	mouseDpad = false;
	mouseStick = 1; // (left, right)
	mouseButton = gp_shoulderrb;
}