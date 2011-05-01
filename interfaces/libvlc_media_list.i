%module vlc

%{
module VLC
	module Media
		module List
  		extend FFI::Library
  		ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_media_list.h

%{
		end
	end
end
%}
