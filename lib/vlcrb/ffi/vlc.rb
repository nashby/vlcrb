module VLC
  extend FFI::Library
  ffi_lib "libvlc"
  VLC_VLC_H = 1
end
