#define window_get_active_rect
/// window_get_active_rect()->
var _buf = window_get_active_title_prepare_buffer(16);
if (window_get_active_rect_raw(buffer_get_address(_buf), 16)) {
	var _struct_0 = array_create(4); // window_rect
	_struct_0[0] = buffer_read(_buf, buffer_s32); // x
	_struct_0[1] = buffer_read(_buf, buffer_s32); // y
	_struct_0[2] = buffer_read(_buf, buffer_s32); // w
	_struct_0[3] = buffer_read(_buf, buffer_s32); // h
	return _struct_0;
} else return undefined;

