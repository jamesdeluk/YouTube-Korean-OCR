Write-Host "Start!"
$files = Get-ChildItem -File -Filter "*.png"
$filesCount = $files.Count
Write-Host "Got $filesCount images"
Write-Host "Cropping images"
mogrify -crop 1280x50+0+610 *.png
Write-Host "Joining images"
convert -append *.png out.png
Write-Host "Done!"