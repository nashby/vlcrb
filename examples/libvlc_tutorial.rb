# example from http://wiki.videolan.org/LibVLC_Tutorial
require 'vlcrb'

inst = VLC::LibVLC.libvlc_new(0, nil)
m = VLC::Media.libvlc_media_new_location(inst, "examples/1.flv") 
mp = VLC::Media::Player.libvlc_media_player_new_from_media(m)
VLC::Media::Player.libvlc_media_player_play(mp)
sleep(100)
