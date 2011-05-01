
module VLC
 module Events
   extend FFI::Library
   ffi_lib "libvlc"
  LIBVLC_EVENTS_H = 1
  libvlc_MediaMetaChanged = 0
  libvlc_MediaPlayerMediaChanged = 0x100
  libvlc_MediaListItemAdded = 0x200
  libvlc_MediaListViewItemAdded = 0x300
  libvlc_MediaListPlayerPlayed = 0x400
  libvlc_MediaDiscovererStarted = 0x500
  libvlc_VlmMediaAdded = 0x600
  libvlc_MediaListPlayerNextItemSet = 1
  libvlc_MediaDiscovererEnded = 1
  libvlc_MediaPlayerNothingSpecial = 1
  libvlc_MediaListWillAddItem = 1
  libvlc_MediaSubItemAdded = 1
  libvlc_VlmMediaRemoved = 1
  libvlc_MediaListViewWillAddItem = 1
  libvlc_MediaPlayerEncounteredError = 10
  libvlc_VlmMediaInstanceStatusError = 10
  libvlc_MediaPlayerTimeChanged = 11
  libvlc_MediaPlayerPositionChanged = 12
  libvlc_MediaPlayerSeekableChanged = 13
  libvlc_MediaPlayerPausableChanged = 14
  libvlc_MediaPlayerTitleChanged = 15
  libvlc_MediaPlayerSnapshotTaken = 16
  libvlc_MediaPlayerLengthChanged = 17
  libvlc_MediaPlayerOpening = 2
  libvlc_MediaListPlayerStopped = 2
  libvlc_MediaDurationChanged = 2
  libvlc_VlmMediaChanged = 2
  libvlc_MediaListViewItemDeleted = 2
  libvlc_MediaListItemDeleted = 2
  libvlc_MediaParsedChanged = 3
  libvlc_MediaListWillDeleteItem = 3
  libvlc_MediaListViewWillDeleteItem = 3
  libvlc_MediaPlayerBuffering = 3
  libvlc_VlmMediaInstanceStarted = 3
  libvlc_VlmMediaInstanceStopped = 4
  libvlc_MediaFreed = 4
  libvlc_MediaPlayerPlaying = 4
  libvlc_MediaStateChanged = 5
  libvlc_MediaPlayerPaused = 5
  libvlc_VlmMediaInstanceStatusInit = 5
  libvlc_MediaPlayerStopped = 6
  libvlc_VlmMediaInstanceStatusOpening = 6
  libvlc_MediaPlayerForward = 7
  libvlc_VlmMediaInstanceStatusPlaying = 7
  libvlc_MediaPlayerBackward = 8
  libvlc_VlmMediaInstanceStatusPause = 8
  libvlc_VlmMediaInstanceStatusEnd = 9
  libvlc_MediaPlayerEndReached = 9

  class LibvlcEventTUMediaMetaChanged < FFI::Struct
    layout(
           :meta_type, libvlc_meta_t
    )
  end
  class LibvlcEventTUMediaSubitemAdded < FFI::Struct
    layout(
           :new_child, :pointer
    )
  end
  class LibvlcEventTUMediaDurationChanged < FFI::Struct
    layout(
           :new_duration, int64_t
    )
  end
  class LibvlcEventTUMediaParsedChanged < FFI::Struct
    layout(
           :new_status, :int
    )
  end
  class LibvlcEventTUMediaFreed < FFI::Struct
    layout(
           :md, :pointer
    )
  end
  class LibvlcEventTUMediaStateChanged < FFI::Struct
    layout(
           :new_state, libvlc_state_t
    )
  end
  class LibvlcEventTUMediaPlayerPositionChanged < FFI::Struct
    layout(
           :new_position, :float
    )
  end
  class LibvlcEventTUMediaPlayerTimeChanged < FFI::Struct
    layout(
           :new_time, libvlc_time_t
    )
  end
  class LibvlcEventTUMediaPlayerTitleChanged < FFI::Struct
    layout(
           :new_title, :int
    )
  end
  class LibvlcEventTUMediaPlayerSeekableChanged < FFI::Struct
    layout(
           :new_seekable, :int
    )
  end
  class LibvlcEventTUMediaPlayerPausableChanged < FFI::Struct
    layout(
           :new_pausable, :int
    )
  end
  class LibvlcEventTUMediaListItemAdded < FFI::Struct
    layout(
           :item, :pointer,
           :index, :int
    )
  end
  class LibvlcEventTUMediaListWillAddItem < FFI::Struct
    layout(
           :item, :pointer,
           :index, :int
    )
  end
  class LibvlcEventTUMediaListItemDeleted < FFI::Struct
    layout(
           :item, :pointer,
           :index, :int
    )
  end
  class LibvlcEventTUMediaListWillDeleteItem < FFI::Struct
    layout(
           :item, :pointer,
           :index, :int
    )
  end
  class LibvlcEventTUMediaListPlayerNextItemSet < FFI::Struct
    layout(
           :item, :pointer
    )
  end
  class LibvlcEventTUMediaPlayerSnapshotTaken < FFI::Struct
    layout(
           :psz_filename, :pointer
    )
    def psz_filename=(str)
      @psz_filename = FFI::MemoryPointer.from_string(str)
      self[:psz_filename] = @psz_filename
    end
    def psz_filename
      @psz_filename.get_string(0)
    end

  end
  class LibvlcEventTUMediaPlayerLengthChanged < FFI::Struct
    layout(
           :new_length, libvlc_time_t
    )
  end
  class LibvlcEventTUVlmMediaEvent < FFI::Struct
    layout(
           :psz_media_name, :pointer,
           :psz_instance_name, :pointer
    )
    def psz_media_name=(str)
      @psz_media_name = FFI::MemoryPointer.from_string(str)
      self[:psz_media_name] = @psz_media_name
    end
    def psz_media_name
      @psz_media_name.get_string(0)
    end
    def psz_instance_name=(str)
      @psz_instance_name = FFI::MemoryPointer.from_string(str)
      self[:psz_instance_name] = @psz_instance_name
    end
    def psz_instance_name
      @psz_instance_name.get_string(0)
    end

  end
  class LibvlcEventTUMediaPlayerMediaChanged < FFI::Struct
    layout(
           :new_media, :pointer
    )
  end
# FIXME: Nested structures are not correctly supported at the moment.
# Please check the order of the declarations in the structure below.
#   class LibvlcEventTU < FFI::Union
#     layout(
#            :media_player_media_changed, LibvlcEventTUMediaPlayerMediaChanged,
#            :vlm_media_event, LibvlcEventTUVlmMediaEvent,
#            :media_player_length_changed, LibvlcEventTUMediaPlayerLengthChanged,
#            :media_player_snapshot_taken, LibvlcEventTUMediaPlayerSnapshotTaken,
#            :media_list_player_next_item_set, LibvlcEventTUMediaListPlayerNextItemSet,
#            :media_list_will_delete_item, LibvlcEventTUMediaListWillDeleteItem,
#            :media_list_item_deleted, LibvlcEventTUMediaListItemDeleted,
#            :media_list_will_add_item, LibvlcEventTUMediaListWillAddItem,
#            :media_list_item_added, LibvlcEventTUMediaListItemAdded,
#            :media_player_pausable_changed, LibvlcEventTUMediaPlayerPausableChanged,
#            :media_player_seekable_changed, LibvlcEventTUMediaPlayerSeekableChanged,
#            :media_player_title_changed, LibvlcEventTUMediaPlayerTitleChanged,
#            :media_player_time_changed, LibvlcEventTUMediaPlayerTimeChanged,
#            :media_player_position_changed, LibvlcEventTUMediaPlayerPositionChanged,
#            :media_state_changed, LibvlcEventTUMediaStateChanged,
#            :media_freed, LibvlcEventTUMediaFreed,
#            :media_parsed_changed, LibvlcEventTUMediaParsedChanged,
#            :media_duration_changed, LibvlcEventTUMediaDurationChanged,
#            :media_subitem_added, LibvlcEventTUMediaSubitemAdded,
#            :media_meta_changed, LibvlcEventTUMediaMetaChanged
#     )
#   end
# FIXME: Nested structures are not correctly supported at the moment.
# Please check the order of the declarations in the structure below.
#   class LibvlcEventT < FFI::Struct
#     layout(
#            :type, :int,
#            :p_obj, :pointer,
#            :u, LibvlcEventTU
#     )
#   end

 end
end
