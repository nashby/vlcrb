
module VLC
 module Media
  module List
    extend FFI::Library
    ffi_lib "libvlc"
  LIBVLC_MEDIA_LIST_H = 1
  attach_function :libvlc_media_list_new, [ :pointer ], :pointer
  attach_function :libvlc_media_list_release, [ :pointer ], :void
  attach_function :libvlc_media_list_retain, [ :pointer ], :void
  attach_function :libvlc_media_list_add_file_content, [ :pointer, :string ], :int
  attach_function :libvlc_media_list_set_media, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_list_media, [ :pointer ], :pointer
  attach_function :libvlc_media_list_add_media, [ :pointer, :pointer ], :int
  attach_function :libvlc_media_list_insert_media, [ :pointer, :pointer, :int ], :int
  attach_function :libvlc_media_list_remove_index, [ :pointer, :int ], :int
  attach_function :libvlc_media_list_count, [ :pointer ], :int
  attach_function :libvlc_media_list_item_at_index, [ :pointer, :int ], :pointer
  attach_function :libvlc_media_list_index_of_item, [ :pointer, :pointer ], :int
  attach_function :libvlc_media_list_is_readonly, [ :pointer ], :int
  attach_function :libvlc_media_list_lock, [ :pointer ], :void
  attach_function :libvlc_media_list_unlock, [ :pointer ], :void
  attach_function :libvlc_media_list_event_manager, [ :pointer ], :pointer

  end
 end
end
