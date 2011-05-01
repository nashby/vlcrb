
module VLC
 module LibVLC
   extend FFI::Library
   ffi_lib "libvlc"
  VLC_LIBVLC_H = 1
  attach_function :libvlc_errmsg, [  ], :string
  attach_function :libvlc_clearerr, [  ], :void
  attach_function :libvlc_vprinterr, [ :string, va_list ], :string
  attach_function :libvlc_printerr, [ :string, :varargs ], :string
  attach_function :libvlc_new, [ :int, :pointer ], :pointer
  attach_function :libvlc_release, [ :pointer ], :void
  attach_function :libvlc_retain, [ :pointer ], :void
  attach_function :libvlc_add_intf, [ :pointer, :string ], :int
  attach_function :libvlc_wait, [ :pointer ], :void
  attach_function :libvlc_set_user_agent, [ :pointer, :string, :string ], :void
  attach_function :libvlc_get_version, [  ], :string
  attach_function :libvlc_get_compiler, [  ], :string
  attach_function :libvlc_get_changeset, [  ], :string
  callback(:libvlc_callback_t, [ :pointer, :pointer ], :void)
  attach_function :libvlc_event_attach, [ :pointer, :int, :libvlc_callback_t, :pointer ], :int
  attach_function :libvlc_event_detach, [ :pointer, :int, :libvlc_callback_t, :pointer ], :void
  attach_function :libvlc_event_type_name, [ :int ], :string
  attach_function :libvlc_get_log_verbosity, [ :pointer ], :uint
  attach_function :libvlc_set_log_verbosity, [ :pointer, :uint ], :void
  attach_function :libvlc_log_open, [ :pointer ], :pointer
  attach_function :libvlc_log_close, [ :pointer ], :void
  attach_function :libvlc_log_count, [ :pointer ], :uint
  attach_function :libvlc_log_clear, [ :pointer ], :void
  attach_function :libvlc_log_get_iterator, [ :pointer ], :pointer
  attach_function :libvlc_log_iterator_free, [ :pointer ], :void
  attach_function :libvlc_log_iterator_has_next, [ :pointer ], :int
  attach_function :libvlc_log_iterator_next, [ :pointer, :pointer ], :pointer

 end
end
