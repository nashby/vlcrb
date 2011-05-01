
module VLC
 module Media
  module Player
    extend FFI::Library
    ffi_lib "libvlc"
  VLC_LIBVLC_MEDIA_PLAYER_H = 1
  class LibvlcTrackDescriptionT < FFI::Struct
    layout(
           :i_id, :int,
           :psz_name, :pointer,
           :p_next, :pointer
    )
    def psz_name=(str)
      @psz_name = FFI::MemoryPointer.from_string(str)
      self[:psz_name] = @psz_name
    end
    def psz_name
      @psz_name.get_string(0)
    end

  end
  class LibvlcAudioOutputT < FFI::Struct
    layout(
           :psz_name, :pointer,
           :psz_description, :pointer,
           :p_next, :pointer
    )
    def psz_name=(str)
      @psz_name = FFI::MemoryPointer.from_string(str)
      self[:psz_name] = @psz_name
    end
    def psz_name
      @psz_name.get_string(0)
    end
    def psz_description=(str)
      @psz_description = FFI::MemoryPointer.from_string(str)
      self[:psz_description] = @psz_description
    end
    def psz_description
      @psz_description.get_string(0)
    end

  end
  class LibvlcRectangleT < FFI::Struct
    layout(
           :top, :int,
           :left, :int,
           :bottom, :int,
           :right, :int
    )
  end
  libvlc_marquee_Enable = 0
  libvlc_marquee_Text = 1
  libvlc_marquee_Color = 2
  libvlc_marquee_Opacity = 3
  libvlc_marquee_Position = 4
  libvlc_marquee_Refresh = 5
  libvlc_marquee_Size = 6
  libvlc_marquee_Timeout = 7
  libvlc_marquee_X = 8
  libvlc_marquee_Y = 9

  attach_function :libvlc_media_player_new, [ :pointer ], :pointer
  attach_function :libvlc_media_player_new_from_media, [ :pointer ], :pointer
  attach_function :libvlc_media_player_release, [ :pointer ], :void
  attach_function :libvlc_media_player_retain, [ :pointer ], :void
  attach_function :libvlc_media_player_set_media, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_player_get_media, [ :pointer ], :pointer
  attach_function :libvlc_media_player_event_manager, [ :pointer ], :pointer
  attach_function :libvlc_media_player_is_playing, [ :pointer ], :int
  attach_function :libvlc_media_player_play, [ :pointer ], :int
  attach_function :libvlc_media_player_set_pause, [ :pointer, :int ], :void
  attach_function :libvlc_media_player_pause, [ :pointer ], :void
  attach_function :libvlc_media_player_stop, [ :pointer ], :void
  attach_function :libvlc_video_set_callbacks, [ :pointer, callback([ :pointer, :pointer ], :pointer), callback([ :pointer, :pointer, :pointer ], :void), callback([ :pointer, :pointer ], :void), :pointer ], :pointer
  attach_function :libvlc_video_set_format, [ :pointer, :string, :uint, :uint, :uint ], :void
  attach_function :libvlc_media_player_set_nsobject, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_player_get_nsobject, [ :pointer ], :pointer
  attach_function :libvlc_media_player_set_agl, [ :pointer, uint32_t ], :void
  attach_function :libvlc_media_player_get_agl, [ :pointer ], uint32_t
  attach_function :libvlc_media_player_set_xwindow, [ :pointer, uint32_t ], :void
  attach_function :libvlc_media_player_get_xwindow, [ :pointer ], uint32_t
  attach_function :libvlc_media_player_set_hwnd, [ :pointer, :pointer ], :void
  attach_function :libvlc_media_player_get_hwnd, [ :pointer ], :pointer
  attach_function :libvlc_media_player_get_length, [ :pointer ], libvlc_time_t
  attach_function :libvlc_media_player_get_time, [ :pointer ], libvlc_time_t
  attach_function :libvlc_media_player_set_time, [ :pointer, libvlc_time_t ], :void
  attach_function :libvlc_media_player_get_position, [ :pointer ], :float
  attach_function :libvlc_media_player_set_position, [ :pointer, :float ], :void
  attach_function :libvlc_media_player_set_chapter, [ :pointer, :int ], :void
  attach_function :libvlc_media_player_get_chapter, [ :pointer ], :int
  attach_function :libvlc_media_player_get_chapter_count, [ :pointer ], :int
  attach_function :libvlc_media_player_will_play, [ :pointer ], :int
  attach_function :libvlc_media_player_get_chapter_count_for_title, [ :pointer, :int ], :int
  attach_function :libvlc_media_player_set_title, [ :pointer, :int ], :void
  attach_function :libvlc_media_player_get_title, [ :pointer ], :int
  attach_function :libvlc_media_player_get_title_count, [ :pointer ], :int
  attach_function :libvlc_media_player_previous_chapter, [ :pointer ], :void
  attach_function :libvlc_media_player_next_chapter, [ :pointer ], :void
  attach_function :libvlc_media_player_get_rate, [ :pointer ], :float
  attach_function :libvlc_media_player_set_rate, [ :pointer, :float ], :int
  attach_function :libvlc_media_player_get_state, [ :pointer ], libvlc_state_t
  attach_function :libvlc_media_player_get_fps, [ :pointer ], :float
  attach_function :libvlc_media_player_has_vout, [ :pointer ], :uint
  attach_function :libvlc_media_player_is_seekable, [ :pointer ], :int
  attach_function :libvlc_media_player_can_pause, [ :pointer ], :int
  attach_function :libvlc_media_player_next_frame, [ :pointer ], :void
  attach_function :libvlc_track_description_release, [ :pointer ], :void
  attach_function :libvlc_toggle_fullscreen, [ :pointer ], :void
  attach_function :libvlc_set_fullscreen, [ :pointer, :int ], :void
  attach_function :libvlc_get_fullscreen, [ :pointer ], :int
  attach_function :libvlc_video_set_key_input, [ :pointer, :uint ], :void
  attach_function :libvlc_video_set_mouse_input, [ :pointer, :uint ], :void
  attach_function :libvlc_video_get_size, [ :pointer, :uint, :pointer, :pointer ], :int
  attach_function :libvlc_video_get_height, [ :pointer ], :int
  attach_function :libvlc_video_get_width, [ :pointer ], :int
  attach_function :libvlc_video_get_cursor, [ :pointer, :uint, :pointer, :pointer ], :int
  attach_function :libvlc_video_get_scale, [ :pointer ], :float
  attach_function :libvlc_video_set_scale, [ :pointer, :float ], :void
  attach_function :libvlc_video_get_aspect_ratio, [ :pointer ], :string
  attach_function :libvlc_video_set_aspect_ratio, [ :pointer, :string ], :void
  attach_function :libvlc_video_get_spu, [ :pointer ], :int
  attach_function :libvlc_video_get_spu_count, [ :pointer ], :int
  attach_function :libvlc_video_get_spu_description, [ :pointer ], :pointer
  attach_function :libvlc_video_set_spu, [ :pointer, :uint ], :int
  attach_function :libvlc_video_set_subtitle_file, [ :pointer, :string ], :int
  attach_function :libvlc_video_get_title_description, [ :pointer ], :pointer
  attach_function :libvlc_video_get_chapter_description, [ :pointer, :int ], :pointer
  attach_function :libvlc_video_get_crop_geometry, [ :pointer ], :string
  attach_function :libvlc_video_set_crop_geometry, [ :pointer, :string ], :void
  attach_function :libvlc_video_get_teletext, [ :pointer ], :int
  attach_function :libvlc_video_set_teletext, [ :pointer, :int ], :void
  attach_function :libvlc_toggle_teletext, [ :pointer ], :void
  attach_function :libvlc_video_get_track_count, [ :pointer ], :int
  attach_function :libvlc_video_get_track_description, [ :pointer ], :pointer
  attach_function :libvlc_video_get_track, [ :pointer ], :int
  attach_function :libvlc_video_set_track, [ :pointer, :int ], :int
  attach_function :libvlc_video_take_snapshot, [ :pointer, :uint, :string, :uint, :uint ], :int
  attach_function :libvlc_video_set_deinterlace, [ :pointer, :string ], :void
  attach_function :libvlc_video_get_marquee_int, [ :pointer, :uint ], :int
  attach_function :libvlc_video_get_marquee_string, [ :pointer, :uint ], :string
  attach_function :libvlc_video_set_marquee_int, [ :pointer, :uint, :int ], :void
  attach_function :libvlc_video_set_marquee_string, [ :pointer, :uint, :string ], :void
  libvlc_logo_enable = 0
  libvlc_logo_file = 1
  libvlc_logo_x = 2
  libvlc_logo_y = 3
  libvlc_logo_delay = 4
  libvlc_logo_repeat = 5
  libvlc_logo_opacity = 6
  libvlc_logo_position = 7

  attach_function :libvlc_video_get_logo_int, [ :pointer, :uint ], :int
  attach_function :libvlc_video_set_logo_int, [ :pointer, :uint, :int ], :void
  attach_function :libvlc_video_set_logo_string, [ :pointer, :uint, :string ], :void
  libvlc_adjust_Enable = 0
  libvlc_adjust_Contrast = 1
  libvlc_adjust_Brightness = 2
  libvlc_adjust_Hue = 3
  libvlc_adjust_Saturation = 4
  libvlc_adjust_Gamma = 5

  attach_function :libvlc_video_get_adjust_int, [ :pointer, :uint ], :int
  attach_function :libvlc_video_set_adjust_int, [ :pointer, :uint, :int ], :void
  attach_function :libvlc_video_get_adjust_float, [ :pointer, :uint ], :float
  attach_function :libvlc_video_set_adjust_float, [ :pointer, :uint, :float ], :void
  libvlc_AudioOutputDevice_Error = -1
  libvlc_AudioOutputDevice_Mono = 1
  libvlc_AudioOutputDevice_SPDIF = 10
  libvlc_AudioOutputDevice_Stereo = 2
  libvlc_AudioOutputDevice_2F2R = 4
  libvlc_AudioOutputDevice_3F2R = 5
  libvlc_AudioOutputDevice_5_1 = 6
  libvlc_AudioOutputDevice_6_1 = 7
  libvlc_AudioOutputDevice_7_1 = 8

  libvlc_AudioChannel_Error = -1
  libvlc_AudioChannel_Stereo = 1
  libvlc_AudioChannel_RStereo = 2
  libvlc_AudioChannel_Left = 3
  libvlc_AudioChannel_Right = 4
  libvlc_AudioChannel_Dolbys = 5

  attach_function :libvlc_audio_output_list_get, [ :pointer ], :pointer
  attach_function :libvlc_audio_output_list_release, [ :pointer ], :void
  attach_function :libvlc_audio_output_set, [ :pointer, :string ], :int
  attach_function :libvlc_audio_output_device_count, [ :pointer, :string ], :int
  attach_function :libvlc_audio_output_device_longname, [ :pointer, :string, :int ], :string
  attach_function :libvlc_audio_output_device_id, [ :pointer, :string, :int ], :string
  attach_function :libvlc_audio_output_device_set, [ :pointer, :string, :string ], :void
  attach_function :libvlc_audio_output_get_device_type, [ :pointer ], :int
  attach_function :libvlc_audio_output_set_device_type, [ :pointer, :int ], :void
  attach_function :libvlc_audio_toggle_mute, [ :pointer ], :void
  attach_function :libvlc_audio_get_mute, [ :pointer ], :int
  attach_function :libvlc_audio_set_mute, [ :pointer, :int ], :void
  attach_function :libvlc_audio_get_volume, [ :pointer ], :int
  attach_function :libvlc_audio_set_volume, [ :pointer, :int ], :int
  attach_function :libvlc_audio_get_track_count, [ :pointer ], :int
  attach_function :libvlc_audio_get_track_description, [ :pointer ], :pointer
  attach_function :libvlc_audio_get_track, [ :pointer ], :int
  attach_function :libvlc_audio_set_track, [ :pointer, :int ], :int
  attach_function :libvlc_audio_get_channel, [ :pointer ], :int
  attach_function :libvlc_audio_set_channel, [ :pointer, :int ], :int
  attach_function :libvlc_audio_get_delay, [ :pointer ], int64_t
  attach_function :libvlc_audio_set_delay, [ :pointer, int64_t ], :int

  end
 end
end
