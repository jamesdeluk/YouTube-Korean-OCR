Write-Host "Start!"
$input = Get-ChildItem -File -Filter "*.mp4" | Select-Object -First 1 | ForEach-Object { $_.BaseName }
Write-Host "Processing $input.mp4"
$middle = Read-Host "Mid (XX:XX:XX)"
$end = Read-Host "End (XX:XX:XX)"
$ffmpegCmd = "ffmpeg -loglevel warning -i `"$input.mp4`" -ss 00:00:00 -to `"$middle`" `"${input}-a.mp4`" -ss `"$middle`" -to `"$end`" `"${input}-b.mp4`""
Invoke-Expression -Command $ffmpegCmd
Write-Host "Done!"