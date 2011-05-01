module VLC
	module Types
		extend FFI::Library
		ffi_lib "libvlc"
		
	  Libvlc_meta_t = enum(
	  :libvlc_meta_Title, 0,
			:libvlc_meta_Artist, 1,
			:libvlc_meta_URL, 10,
			:libvlc_meta_Language, 11,
			:libvlc_meta_NowPlaying, 12,
			:libvlc_meta_Publisher, 13,
			:libvlc_meta_EncodedBy, 14,
			:libvlc_meta_ArtworkURL, 15,
			:libvlc_meta_TrackID, 16,
			:libvlc_meta_Genre, 2,
			:libvlc_meta_Copyright, 3,
			:libvlc_meta_Album, 4,
			:libvlc_meta_TrackNumber, 5,
			:libvlc_meta_Description, 6,
			:libvlc_meta_Rating, 7,
			:libvlc_meta_Date, 8,
			:libvlc_meta_Setting, 9
		)
		
		Libvlc_event_e = enum(
		  :libvlc_MediaMetaChanged,0,
		  :libvlc_MediaSubItemAdded,
		  :libvlc_MediaDurationChanged,
		  :libvlc_MediaParsedChanged,
		  :libvlc_MediaFreed,
		  :libvlc_MediaStateChanged,

		  :libvlc_MediaPlayerMediaChanged,0x100,
		  :libvlc_MediaPlayerNothingSpecial,
		  :libvlc_MediaPlayerOpening,
		  :libvlc_MediaPlayerBuffering,
		  :libvlc_MediaPlayerPlaying,
		  :libvlc_MediaPlayerPaused,
		  :libvlc_MediaPlayerStopped,
		  :libvlc_MediaPlayerForward,
		  :libvlc_MediaPlayerBackward,
		  :libvlc_MediaPlayerEndReached,
		  :libvlc_MediaPlayerEncounteredError,
		  :libvlc_MediaPlayerTimeChanged,
		  :libvlc_MediaPlayerPositionChanged,
		  :libvlc_MediaPlayerSeekableChanged,
		  :libvlc_MediaPlayerPausableChanged,
		  :libvlc_MediaPlayerTitleChanged,
		  :libvlc_MediaPlayerSnapshotTaken,
		  :libvlc_MediaPlayerLengthChanged,

		  :libvlc_MediaListItemAdded,0x200,
		  :libvlc_MediaListWillAddItem,
		  :libvlc_MediaListItemDeleted,
		  :libvlc_MediaListWillDeleteItem,

		  :libvlc_MediaListViewItemAdded,0x300,
		  :libvlc_MediaListViewWillAddItem,
		  :libvlc_MediaListViewItemDeleted,
		  :libvlc_MediaListViewWillDeleteItem,

		  :libvlc_MediaListPlayerPlayed,0x400,
		  :libvlc_MediaListPlayerNextItemSet,
		  :libvlc_MediaListPlayerStopped,

		  :libvlc_MediaDiscovererStarted,0x500,
		  :libvlc_MediaDiscovererEnded,

		  :libvlc_VlmMediaAdded,0x600,
		  :libvlc_VlmMediaRemoved,
		  :libvlc_VlmMediaChanged,
		  :libvlc_VlmMediaInstanceStarted,
		  :libvlc_VlmMediaInstanceStopped,
		  :libvlc_VlmMediaInstanceStatusInit,
		  :libvlc_VlmMediaInstanceStatusOpening,
		  :libvlc_VlmMediaInstanceStatusPlaying,
		  :libvlc_VlmMediaInstanceStatusPause,
		  :libvlc_VlmMediaInstanceStatusEnd,
		  :libvlc_VlmMediaInstanceStatusError
		)
		
		Libvlc_state_t = enum(
			:libvlc_NothingSpecial, 0,
			:libvlc_Opening,
			:libvlc_Buffering,
			:libvlc_Playing,
			:libvlc_Paused,
			:libvlc_Stopped,
			:libvlc_Ended,
			:libvlc_Error 
		)

		Libvlc_track_type_t = enum(
			:libvlc_track_unknown, -1,
			:libvlc_track_audio,
			:libvlc_track_video,
			:libvlc_track_text
		)
		
	end
end
