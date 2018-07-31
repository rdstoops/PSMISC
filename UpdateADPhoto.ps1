#Get .JPG files named for users, insert thumbnail into AD
$files = get-childitem *Path* *.jpg
foreach ($file in $files) {
$photo = [byte[]](Get-Content $file.fullname -Encoding byte)
Set-ADUser $file.BaseName -Replace @{thumbnailPhoto=$photo} 
}