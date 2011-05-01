%module vlc

%{
module VLC
	module Events
  	extend FFI::Library
  	ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_events.h

%{
	end
end
%}
