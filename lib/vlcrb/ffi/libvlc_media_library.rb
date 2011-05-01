
module VLC
 module Media
  module Library
    extend FFI::Library
    ffi_lib "libvlc"
  VLC_LIBVLC_MEDIA_LIBRARY_H = 1
  attach_function :libvlc_media_library_new, [ :pointer ], :pointer
  attach_function :libvlc_media_library_release, [ :pointer ], :void
  attach_function :libvlc_media_library_retain, [ :pointer ], :void
  attach_function :libvlc_media_library_load, [ :pointer ], :int
  attach_function :libvlc_media_library_media_list, [ :pointer ], :pointer

  end
 end
end
