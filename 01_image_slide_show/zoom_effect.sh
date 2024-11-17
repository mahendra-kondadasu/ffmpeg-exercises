ffmpeg -loop 1 -t 3 -framerate 60 -i image1.jpg \
-loop 1 -t 3 -framerate 60 -i image2.jpg \
-loop 1 -t 3 -framerate 60 -i image3.jpg \
-filter_complex "\
[0]scale=8000:-1,zoompan=z='zoom+0.001':x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):d=3*60:s=1920x1280:fps=60[s0];
[1]scale=8000:-1,zoompan=z='zoom+0.001':x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):d=3*60:s=1920x1280:fps=60[s1];
[2]scale=8000:-1,zoompan=z='zoom+0.001':x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):d=3*60:s=1920x1280:fps=60[s2];
[s0][s1]xfade=transition=circleopen:duration=1:offset=2[f0];
[f0][s2]xfade=transition=circleopen:duration=1:offset=4" \
-t 7 -c:v libx264 -pix_fmt yuv420p zoom_effect.mp4 -y