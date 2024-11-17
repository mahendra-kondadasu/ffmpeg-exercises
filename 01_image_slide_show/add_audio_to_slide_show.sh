ffmpeg -framerate 1 -i image%d.jpg -i music.mp3 -shortest -r 25 \
-c:v libx264 -pix_fmt yuv420p slide_show_with_music.mp4 -y