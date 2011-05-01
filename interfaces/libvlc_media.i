%module vlc

%{
module VLC
	module Media
  	extend FFI::Library
		ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_media.h

%{
	end
end
%}
