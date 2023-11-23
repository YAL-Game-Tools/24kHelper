/// @author YellowAfterlife

#include "stdafx.h"
#include "tiny_string.h"

tiny_string strconv{};
dllx const char* window_get_active_title() {
	static wchar_t title[1024];
	auto hwnd = GetForegroundWindow();
	if (hwnd == NULL) return "";
	GetWindowTextW(hwnd, title, std::size(title));
	return strconv.conv(title);
}


struct window_rect {
	int x = 0;
	int y = 0;
	int w = 0;
	int h = 0;
};
dllg window_rect window_get_active_rect() {
	auto hwnd = GetForegroundWindow();
	window_rect result{};
	if (hwnd == NULL) return result;
	RECT cr{};
	GetClientRect(hwnd, &cr);
	POINT tl, br;
	tl.x = cr.left;
	tl.y = cr.top;
	ClientToScreen(hwnd, &tl);
	br.x = cr.right;
	br.y = cr.bottom;
	ClientToScreen(hwnd, &br);
	result.x = tl.x;
	result.y = tl.y;
	result.w = br.x - tl.x;
	result.h = br.y - tl.y;
	return result;
}

static inline void init() {
	//
}
BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved) {
	if (ul_reason_for_call == DLL_PROCESS_ATTACH) init();
	return TRUE;
}
