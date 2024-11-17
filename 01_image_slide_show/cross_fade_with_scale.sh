ffmpeg -loop 1 -t 3 -framerate 60 -i image1.jpg \
-loop 1 -t 3 -framerate 60 -i image2.jpg \
-loop 1 -t 3 -framerate 60 -i image3.jpg \
-filter_complex "\
[0]scale=1920:1280:force_original_aspect_ratio=decrease,pad=1920:1280:-1:-1[s0];
[1]scale=1920:1280:force_original_aspect_ratio=decrease,pad=1920:1280:-1:-1[s1];
[2]scale=1920:1280:force_original_aspect_ratio=decrease,pad=1920:1280:-1:-1[s2];
[s0][s1]xfade=transition=wipeup:duration=1:offset=2[f0];
[f0][s2]xfade=transition=slideright:duration=1:offset=4" \
-c:v libx264 -pix_fmt yuv420p cross_fade_with_scale.mp4 -y