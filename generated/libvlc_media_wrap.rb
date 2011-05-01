
module VLC
 module Media
   extend FFI::Library
  ffi_lib "libvlc"
  VLC_LIBVLC_MEDIA_H = 1
  libvlc_meta_Title = 0
  libvlc_meta_Artist = 1
  libvlc_meta_URL = 10
  libvlc_meta_Language = 11
  libvlc_meta_NowPlaying = 12
  libvlc_meta_Publisher = 13
  libvlc_meta_EncodedBy = 14
  libvlc_meta_ArtworkURL = 15
  libvlc_meta_TrackID = 16
  libvlc_meta_Genre = 2
  libvlc_meta_Copyright = 3
  libvlc_meta_Album = 4
  libvlc_meta_TrackNumber = 5
  libvlc_meta_Description = 6
  libvlc_meta_Rating = 7
  libvlc_meta_Date = 8
  libvlc_meta_Setting = 9

  libvlc_NothingSpecial = 0
  libvlc_Opening = 1
  libvlc_Buffering = 2
  libvlc_Playing = 3
  libvlc_Paused = 4
  libvlc_Stopped = 5
  libvlc_Ended = 6
  libvlc_Error = 7

  libvlc_media_option_unique = 0x100
  libvlc_media_option_trusted = 0x2

  libvlc_track_unknown = -1
  libvlc_track_audio = 0
  libvlc_track_video = 1
  libvlc_track_text = 2

  class LibvlcMediaStatsT < FFI::Struct
    layout(
           :i_read_bytes, :int,
           :f_input_bitrate, :float,
           :i_demux_read_bytes, :int,
           :f_demux_bitrate, :float,
           :i_demux_corrupted, :int,
           :i_demux_discontinuity, :int,
           :i_decoded_video, :int,
           :i_decoded_audio, :int,
           :i_displayed_pictures, :int,
           :i_lost_pictures, :int,
           :i_played_abuffers, :int,
           :i_lost_abuffers, :int,
           :i_sent_packets, :int,
           :i_sent_bytes, :int,
           :f_send_bitrate, :float
    )
  end
  class LibvlcMediaTrackInfoTUAudio < FFI::Struct
    layout(
           :i_channels, :uint,
           :i_rate, :uint
    )
  end
  class LibvlcMediaTrackInfoTUVideo < FFI::Struct
    layout(
           :i_height, :uint,
           :i_width, :uint
    )
  end
# FIXME: Nested structures are not correctly supported at the moment.
# Please check the order of the declarations in the structure below.
#   class LibvlcMediaTrackInfoTU < FFI::Union
#     layout(
#            :video, LibvlcMediaTrackInfoTUVideo,
#            :audio, LibvlcMediaTrackInfoTUAudio
#     )
#   end
# FIXME: Nested structures are not correctly supported at the moment.
# Please check the order of the declarations in the structure below.
#   class LibvlcMediaTrackInfoT < FFI::Struct
#     layout(
#            :i_codec, uint32_t,
#            :i_id, :int,
#            :i_type, :int,
#            :i_profile, :int,
#            :i_level, :int,
#            :u, LibvlcMediaTrackInfoTU
#     )
#   end
  attach_function :libvlc_media_new_location, [ :pointer, :string ], :pointer
  attach_function :libvlc_media_new_path, [ :pointer, :string ], :pointer
  attach_function :libvlc_media_new_fd, [ :pointer, :int ], :pointer
  attach_function :libvlc_media_new_as_node, [ :pointer, :string ], :pointer
  attach_function :libvlc_media_add_option, [ :pointer, :string ], :void
  attach_function :libvlc_media_add_option_flag, [ :pointer, :string, :uint ], :void
  attach_function :libvlc_media_retain, [ :pointer ], :void
  attach_function :libvlc_media_release, [ :pointer ], :void
  attach_function :libvlc_media_get_mrl, [ :pointer ], :string
  attach_function :libvlc_media_duplicate, [ :pointer ], :pointer
  attach_function :libvlc_media_get_meta, [ :pointer, :int ], :string
  attach_function :libvlc_media_set_meta, [ :pointer, :int, :string ], :void
  attach_function :libvlc_media_save_meta, [ :pointer ], :int
  attach_function :libvlc_media_get_state, [ :pointer ], :int
  attach_function :libvlc_media_get_stats, [ :pointer, :pointer ], :int
  attach_function :libvlc_media_subitems, [ :pointer ], :pointer
  attach_function :libvlc_media_event_manager, [ :pointer ], :pointer
  attach_function :libvlc_media_get_duration, [ :pointer ], libvlc_time_t
  attach_function :libvlc_media_parse, [ :pointer ], :void
  attach_function :libvlc_media_parse_async, [ :pointer ], :void
  attach_function :libvlc_media_is_parsed, [ :pointer ], :int
  attach_function :libvlc_media_set_user_data, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_get_user_data, [ :pointer ], :pointer
  attach_function :libvlc_media_get_tracks_info, [ :pointer, :pointer ], :int

 end
end
