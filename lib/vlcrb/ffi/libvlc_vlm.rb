module VLC
  module VLM
    extend FFI::Library
    ffi_lib "libvlc"
    LIBVLC_VLM_H = 1
    
    attach_function :libvlc_vlm_release, [ :pointer ], :void
    attach_function :libvlc_vlm_add_broadcast, [ :pointer, :string, :string, :string, :int, :pointer, :int, :int ], :pointer
    attach_function :libvlc_vlm_add_vod, [ :pointer, :string, :string, :int, :pointer, :int, :string ], :pointer
    attach_function :libvlc_vlm_del_media, [ :pointer, :string ], :int
    attach_function :libvlc_vlm_set_enabled, [ :pointer, :string, :int ], :int
    attach_function :libvlc_vlm_set_output, [ :pointer, :string, :string ], :int
    attach_function :libvlc_vlm_set_input, [ :pointer, :string, :string ], :int
    attach_function :libvlc_vlm_add_input, [ :pointer, :string, :string ], :int
    attach_function :libvlc_vlm_set_loop, [ :pointer, :string, :int ], :int
    attach_function :libvlc_vlm_set_mux, [ :pointer, :string, :string ], :int
    attach_function :libvlc_vlm_change_media, [ :pointer, :string, :string, :string, :int, :pointer, :int, :int ], :pointer
    attach_function :libvlc_vlm_play_media, [ :pointer, :string ], :int
    attach_function :libvlc_vlm_stop_media, [ :pointer, :string ], :int
    attach_function :libvlc_vlm_pause_media, [ :pointer, :string ], :int
    attach_function :libvlc_vlm_seek_media, [ :pointer, :string, :float ], :int
    attach_function :libvlc_vlm_show_media, [ :pointer, :string ], :string
    attach_function :libvlc_vlm_get_media_instance_position, [ :pointer, :string, :int ], :float
    attach_function :libvlc_vlm_get_media_instance_time, [ :pointer, :string, :int ], :int
    attach_function :libvlc_vlm_get_media_instance_length, [ :pointer, :string, :int ], :int
    attach_function :libvlc_vlm_get_media_instance_rate, [ :pointer, :string, :int ], :int
    attach_function :libvlc_vlm_get_event_manager, [ :pointer ], :pointer
  end
end
