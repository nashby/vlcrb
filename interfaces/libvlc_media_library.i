%module vlc

%{
module VLC
	module Media
		module Library
  		extend FFI::Library
  		ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_media_library.h

%{
		end
	end
end
%}
