%module vlc

%{
module VLC
  extend FFI::Library
  ffi_lib "libvlc"
%}

%include libvlc_api.h
%include /usr/include/vlc/vlc.h

%{
end
%}
