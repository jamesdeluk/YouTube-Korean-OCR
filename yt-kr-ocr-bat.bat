set /p url="YouTube video URL: "
yt-dlp -f 22 %url% -o vid-in.mp4
ffmpeg -i vid-in.mp4 -filter:v "crop=1280:100:x:600" vid-crop.mp4
setlocal enabledelayedexpansion
mkdir frames
ffmpeg -i vid-crop.mp4 -start_number 1 -vf fps=1 frames/frame-%%04d.png
python yt-kr-ocr-py.py