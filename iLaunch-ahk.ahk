/*
https://github.com/qrlk/iLaunch-ahk

This is an AHK (https://www.autohotkey.com/) script to control iTunes For Windows via global hotkeys.

This script is a successful attempt to extend the functionality of http://www.ke5fx.com/ilaunch/readme.htm

It uses the 'iTunes COM Interface'.

Unfortunately, this interface has not been updated for many years.
Some must-have features, such as deleting a track from the library without confirmation or setting a 'liked' or 'disliked' mark, could not be implemented.

Tested using iTunes 12.12.6.1, COM v1.3
*/


/*
Ctrl-alt-p to play/pause the current track
Ctrl-alt-s to skip to the next track
Ctrl-alt-b to go back to the previous track

Ctrl-alt-ArrowUp to increase volume
Ctrl-alt-ArrowDown to decrease volume

Ctrl-alt-1 to give a track 20 rating (1 star)
Ctrl-alt-2 to give a track 40 rating (2 star)
Ctrl-alt-3 to give a track 60 rating (3 star)
Ctrl-alt-4 to give a track 80 rating (4 star)
Ctrl-alt-5 to give a track 100 rating (5 star)

Ctrl-alt-a to add current track to the library
*/

iTunes := ComObjCreate("iTunes.Application")

^!p::iTunes.PlayPause() ;Toggle Play/Pause
^!s::iTunes.NextTrack() ;Skip to the next track
^!b::iTunes.BackTrack() ;Go back to the previous track

^!Up::iTunes.SoundVolume := iTunes.SoundVolume + 10 ;+10% volume
^!Down::iTunes.SoundVolume := iTunes.SoundVolume - 10 ;-10% volume

^!1::iTunes.CurrentTrack.Rating := 20 ;Give a track 1 star
^!2::iTunes.CurrentTrack.Rating := 40 ;Give a track 2 stars
^!3::iTunes.CurrentTrack.Rating := 60 ;Give a track 3 stars
^!4::iTunes.CurrentTrack.Rating := 80 ;Give a track 4 stars
^!5::iTunes.CurrentTrack.Rating := 100 ;Give a track 5 stars

^!a::iTunes.LibraryPlaylist.AddTrack(iTunes.CurrentTrack) ;Add current playing track to the library
