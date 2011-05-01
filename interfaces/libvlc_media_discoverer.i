%module vlc

%{
module VLC
	module Media
		module Discoverer
  		extend FFI::Library
  		ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_media_discoverer.h

%{
		end
	end
end
%}
