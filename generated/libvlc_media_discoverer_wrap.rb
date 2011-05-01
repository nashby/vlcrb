
module VLC
 module Media
  module Discoverer
    extend FFI::Library
    ffi_lib "libvlc"
  VLC_LIBVLC_MEDIA_DISCOVERER_H = 1
  attach_function :libvlc_media_discoverer_new_from_name, [ :pointer, :string ], :pointer
  attach_function :libvlc_media_discoverer_release, [ :pointer ], :void
  attach_function :libvlc_media_discoverer_localized_name, [ :pointer ], :string
  attach_function :libvlc_media_discoverer_media_list, [ :pointer ], :pointer
  attach_function :libvlc_media_discoverer_event_manager, [ :pointer ], :pointer
  attach_function :libvlc_media_discoverer_is_running, [ :pointer ], :int

  end
 end
end
