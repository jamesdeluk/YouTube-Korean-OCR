read -p "YouTube video URL: " url
yt-dlp -f 22 $url -o vid.mp4
ffmpeg -i vid.mp4 -filter:v "crop=1280:100:x:600" out.mp4
ffmpeg -i out.mp4 -start_number 1 -vf fps=1 frame-%04d.png
python3 yt-kr-ocr-py.py