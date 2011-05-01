module VLC
  module Structures
    extend FFI::Library
    ffi_lib "libvlc"
    LIBVLC_STRUCTURES_H = 1
    class LibvlcLogMessageT < FFI::Struct
      layout(
             :sizeof_msg, :uint,
             :i_severity, :int,
             :psz_type, :pointer,
             :psz_name, :pointer,
             :psz_header, :pointer,
             :psz_message, :pointer
      )
      def psz_type=(str)
        @psz_type = FFI::MemoryPointer.from_string(str)
        self[:psz_type] = @psz_type
      end
      def psz_type
        @psz_type.get_string(0)
      end
      def psz_name=(str)
        @psz_name = FFI::MemoryPointer.from_string(str)
        self[:psz_name] = @psz_name
      end
      def psz_name
        @psz_name.get_string(0)
      end
      def psz_header=(str)
        @psz_header = FFI::MemoryPointer.from_string(str)
        self[:psz_header] = @psz_header
      end
      def psz_header
        @psz_header.get_string(0)
      end
      def psz_message=(str)
        @psz_message = FFI::MemoryPointer.from_string(str)
        self[:psz_message] = @psz_message
      end
      def psz_message
        @psz_message.get_string(0)
      end
    end
  end
end
