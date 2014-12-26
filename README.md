## WPRB playlists to Spotify playlists

This is sort of a bare-bones lib that will take a playlist generated from WPRB's website (wprb.com) and will convert it
to a Spotify playlist.

### Setup

You will need to populate the `SPOTIFY_API_KEY` and `SPOTIFY_USER` env vars for this to work.


### Usage

rake create_playlist[http://wprb.com/tpm/world/printplaylist.php?show_id=33839]


