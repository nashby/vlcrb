require_relative "types"
module VLC
 module Media
  module List
   module Player
   	 include VLC::Types
     extend FFI::Library
     ffi_lib "libvlc"
  LIBVLC_MEDIA_LIST_PLAYER_H = 1
  libvlc_playback_mode_default = 0
  libvlc_playback_mode_loop = 1
  libvlc_playback_mode_repeat = 2

  attach_function :libvlc_media_list_player_new, [ :pointer ], :pointer
  attach_function :libvlc_media_list_player_release, [ :pointer ], :void
  attach_function :libvlc_media_list_player_event_manager, [ :pointer ], :pointer
  attach_function :libvlc_media_list_player_set_media_player, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_list_player_set_media_list, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_list_player_play, [ :pointer ], :void
  attach_function :libvlc_media_list_player_pause, [ :pointer ], :void
  attach_function :libvlc_media_list_player_is_playing, [ :pointer ], :int
  attach_function :libvlc_media_list_player_get_state, [ :pointer ], VLC::Types::Libvlc_state_t
  attach_function :libvlc_media_list_player_play_item_at_index, [ :pointer, :int ], :int
  attach_function :libvlc_media_list_player_play_item, [ :pointer, :pointer ], :int
  attach_function :libvlc_media_list_player_stop, [ :pointer ], :void
  attach_function :libvlc_media_list_player_next, [ :pointer ], :int
  attach_function :libvlc_media_list_player_previous, [ :pointer ], :int
  attach_function :libvlc_media_list_player_set_playback_mode, [ :pointer, :int ], :void

   end
  end
 end
end
