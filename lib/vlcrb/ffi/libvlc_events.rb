require_relative 'types'

module VLC
	module Events
		include VLC::Types
		extend FFI::Library
		ffi_lib "libvlc"
		LIBVLC_EVENTS_H = 1

		class LibvlcEventTUMediaMetaChanged < FFI::Struct
		layout(
				   :meta_type, VLC::Types::Libvlc_meta_t
		)
		end
		class LibvlcEventTUMediaSubitemAdded < FFI::Struct
		layout(
				   :new_child, :pointer
		)
		end
		class LibvlcEventTUMediaDurationChanged < FFI::Struct
		layout(
				   :new_duration, :int64
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
				   :new_state, VLC::Types::Libvlc_state_t
		)
		end
		class LibvlcEventTUMediaPlayerPositionChanged < FFI::Struct
		layout(
				   :new_position, :float
		)
		end
		class LibvlcEventTUMediaPlayerTimeChanged < FFI::Struct
		layout(
				   :new_time, :int64
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
				   :new_length, :int64
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
		class LibvlcEventTU < FFI::Union
		 layout(
				    :media_player_media_changed, LibvlcEventTUMediaPlayerMediaChanged,
				    :vlm_media_event, LibvlcEventTUVlmMediaEvent,
				    :media_player_length_changed, LibvlcEventTUMediaPlayerLengthChanged,
				    :media_player_snapshot_taken, LibvlcEventTUMediaPlayerSnapshotTaken,
				    :media_list_player_next_item_set, LibvlcEventTUMediaListPlayerNextItemSet,
				    :media_list_will_delete_item, LibvlcEventTUMediaListWillDeleteItem,
				    :media_list_item_deleted, LibvlcEventTUMediaListItemDeleted,
				    :media_list_will_add_item, LibvlcEventTUMediaListWillAddItem,
				    :media_list_item_added, LibvlcEventTUMediaListItemAdded,
				    :media_player_pausable_changed, LibvlcEventTUMediaPlayerPausableChanged,
				    :media_player_seekable_changed, LibvlcEventTUMediaPlayerSeekableChanged,
				    :media_player_title_changed, LibvlcEventTUMediaPlayerTitleChanged,
				    :media_player_time_changed, LibvlcEventTUMediaPlayerTimeChanged,
				    :media_player_position_changed, LibvlcEventTUMediaPlayerPositionChanged,
				    :media_state_changed, LibvlcEventTUMediaStateChanged,
				    :media_freed, LibvlcEventTUMediaFreed,
				    :media_parsed_changed, LibvlcEventTUMediaParsedChanged,
				    :media_duration_changed, LibvlcEventTUMediaDurationChanged,
				    :media_subitem_added, LibvlcEventTUMediaSubitemAdded,
				    :media_meta_changed, LibvlcEventTUMediaMetaChanged
		 )
		end
		class LibvlcEventT < FFI::Struct
		 layout(
				    :type, :int,
				    :p_obj, :pointer,
				    :u, LibvlcEventTU
		 )
		end
	end
end
