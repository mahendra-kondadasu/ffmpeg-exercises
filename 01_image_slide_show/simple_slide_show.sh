ffmpeg -framerate 1 -i image%d.jpg -r 25 \
-c:v libx264 -pix_fmt yuv420p simple_slide_show.mp4 -y