#include "gml_ext.h"
// Struct forward declarations:
// from window_get_active_title.cpp:16:
struct window_rect {
	int x = 0;
	int y = 0;
	int w = 0;
	int h = 0;
};
extern window_rect window_get_active_rect();
dllx double window_get_active_rect_raw(void* _inout_ptr, double _inout_ptr_size) {
	gml_istream _in(_inout_ptr);
	window_rect _ret = window_get_active_rect();
	gml_ostream _out(_inout_ptr);
	_out.write<window_rect>(_ret);
	return 1;
}

