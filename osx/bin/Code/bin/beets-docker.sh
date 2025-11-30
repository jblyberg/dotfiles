docker run -d \
  --name=beets \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 8337:8337 \
  -v /Users/jblyberg/.config/beets:/config \
  -v /Users/jblyberg/Desktop/beets/library:/music \
  -v /Users/jblyberg/Desktop/beets/import:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/beets:latest
