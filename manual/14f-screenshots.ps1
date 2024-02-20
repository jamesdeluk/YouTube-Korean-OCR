Write-Host "Start!"
$OriginalFiles = Get-ChildItem -File -Filter "*.png"
$FilesCount = $OriginalFiles.Count
Write-Host "Got $FilesCount images"
if (!(Test-Path -Path ".\14F\Backup")) {
    New-Item -ItemType Directory -Force -Path ".\14F\Backup" > $null
}
Write-Host "---"
Write-Host "Created backup folder"
foreach ($file in $OriginalFiles) {
    Copy-Item -Path $file.FullName -Destination ".\14F\Backup" -Force
}
Write-Host "Copied images to backup folder"
if (!(Test-Path -Path ".\14F\Cropped")) {
    New-Item -ItemType Directory -Force -Path ".\14F\Cropped" > $null
}
Write-Host "---"
Write-Host "Created cropped folder"
Write-Host "Cropping images..."
mogrify -crop 1050x50+115+610 -path .\14F\Cropped *.png
Write-Host "Images cropped"
Write-Host "---"
Write-Host "Merging images..."
convert -append ".\14F\Cropped\*.png" ".\14F\merged.png"
Write-Host "Merged image created"
Write-Host "---"
# if (!(Test-Path -Path ".\14F\Groups")) {
#     New-Item -ItemType Directory -Force -Path ".\14F\Groups" > $null
# }
# Write-Host "Created groups folder"
# $CroppedFiles = Get-ChildItem -File -Filter ".\14F\Cropped\*.png"
# $GroupSize = 5
# $NumGroups = [Math]::Ceiling($filesCount / $GroupSize)
# Write-Host "Grouping images..."
# for ($i = 1; $i -lt $NumGroups + 1; $i++) {
#     $StartIndex = ($i - 1) * $GroupSize
#     $EndIndex = [Math]::Min($StartIndex + $GroupSize - 1, $FilesCount - 1)
#     $TempArray = $CroppedFiles[$StartIndex..$EndIndex]
#     & convert $TempArray.FullName -append ".\14F\Groups\group_$i.jpg"
#     Write-Host "Created group $i"
# }
# Write-Host "All groups created"
# Write-Host "---"
Write-Host "Deleting original images"
foreach ($file in $OriginalFiles) {
    Remove-Item $file -Force
}
Write-Host "Original images deleted"
Write-Host "---"
Write-Host "Done!"