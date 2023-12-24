Designed to work with 14F's videos, such as those found here: https://www.youtube.com/playlist?list=PL0NUN1E_oXsyfQZ5H6rFXJHLyQts1-8v_

Two methods

# Using EasyOCR

The .sh runs the .py so you only need to worry about having Python and the correct packages installed.

It downloads a video with yt-dlp, crops it using ffmpeg, takes screenshots, then uses EasyOCR to get the text.

**Pros**

- Mostly hands-off

**Cons**

- Quite slow
- Requires more SSD space
- OCR seems worse
- Lots of duplication

# Semi-manual

Manually download the video using yt-dlp, e.g. `yt-dlp -f 22 L9MAYnwkajE -o L9MAYnwkajE.mp4`

Use the ffmpeg script to split it into two (as most of these videos are two stories in one video). You need to manually enter the split time. The video and the script should be the only things in the folder.

Watch the video and manually take screenshots (I use VLC).

Use the crop and join script to automatically crop the screenshots to the subs only and merge them into a single image. The screenshots and the script should be the only things in the folder.

Use PowerToys Text Extractor to OCR the merged screenshot.

**Pros**

- OCR seems better
- No duplication
- More time watching the video (i.e. studying)

**Cons**

- A more manual process
