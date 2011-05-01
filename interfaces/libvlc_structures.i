%module vlc

%{
module VLC
	module Structures
	  extend FFI::Library
	  ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/libvlc_structures.h

%{
end
%}
