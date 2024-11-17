ffmpeg -loop 1 -t 3 -framerate 60 \
-i image1.jpg -loop 1 -t 3 -framerate 60 \
-i image2.jpg -loop 1 -t 3 -framerate 60 \
-i image3.jpg -filter_complex \
"[0][1]xfade=transition=wipeup:duration=1:offset=2[f0]; [f0][2]xfade=transition=slideright:duration=1:offset=4" \
-c:v libx264 -pix_fmt yuv420p cross_fade.mp4 -y