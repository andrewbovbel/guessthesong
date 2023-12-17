#!/usr/bin/env python3
#!/usr/bin/python3
import spotipy
import sys
import start
import random
from rich import print

clientID = 'd627b5bcfd0c4b47a355e133c81f77d3'
clientSecret = 'f02a7e471e714d2eafa1251d6be09059'
redirectURI =  'https://andrewbovbel.github.io'
scope = "streaming"

oauth_object = spotipy.SpotifyOAuth(clientID,clientSecret,redirectURI, scope=scope)
token_dict = oauth_object.get_cached_token()
token = token_dict['access_token']
spotifyObject = spotipy.Spotify(auth=token)
user = spotifyObject.current_user()
spotifyObject.shuffle(True)


def main(playlist_url, show_song):
    timeout = random.randint(1,2)
    start.main(timeout)
    print("[bold][red]Welcome, "+ user['display_name'] + "\n")
    
    while True:
        playlist = spotifyObject.playlist(playlist_url)
        tracks = playlist["tracks"]["items"]
        random.shuffle(tracks)
        

        for trackObj in tracks:
            track = trackObj["track"]
            trackName = track["name"]
            trackUri = track["uri"]
            trackDuration = track["duration_ms"]//2 

            #to guess
            trackYear = track["album"]["release_date"][:4]
            trackArtists = track["artists"]
                
            spotifyObject.start_playback(uris=[trackUri], position_ms = trackDuration)
            if show_song:
                print("now playing: " + "[red]" + trackName)
            else:
                input("Song name: ")
                print("[purple]"+trackName)
            input("Song year: ")
            print(trackYear)
            input("Artist name: ")
            for artist in trackArtists:
                name = artist["name"]
                print("[bold][green]"+name)

            print("\n")

        print("[bold]Let's do it again Kareena. You got this! \n")

if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1], True)
    elif len(sys.argv) == 3:
        main(sys.argv[1], False)
    else:
        print("Please input the playlist url")