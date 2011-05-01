%module vlc

%{
module VLC
	module Media
		module Player
  		extend FFI::Library
  		ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_media_player.h

%{
		end
	end
end
%}
