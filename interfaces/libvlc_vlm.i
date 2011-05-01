%module vlc

%{
module VLC
	module VLM
  	extend FFI::Library
  	ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_vlm.h

%{
	end
end
%}
