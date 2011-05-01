%module vlc

%{
module VLC
	module LibVLC
  	extend FFI::Library
  	ffi_lib "libvlc"
%}

%include /usr/include/vlc/libvlc.h

%{
	end
end
%}
