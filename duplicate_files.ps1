param(
    [Parameter(Mandatory)]
    [String]$SrcDir,

    [Parameter(Mandatory)]
    [String]$DstDir,

    [Parameter(Mandatory)]
    [String]$LogFile
)

$hashes = @{}

# Log file is in CSV format
Out-File -FilePath $LogFile -InputObject "Puvodni umisteni,Nove umisteni" -Encoding utf8

Write-Host "Duplicate files" -ForegroundColor Green -BackgroundColor Black
Write-Host "---------------" -ForegroundColor Green -BackgroundColor Black

$files = @(Get-ChildItem -Path $SrcDir -Recurse)
foreach($file in $files) {
    $file_full_name = $file.FullName
    $file_short_name = $file.Name

    $is_file = (Test-Path -Path $file_full_name -PathType Leaf)  # Skip directories
    if($is_file) {
        $hash = (Get-FileHash $file_full_name)
        If(-not($hash.Hash -in $hashes.keys)) {
            $hashes[$hash.Hash] = $file_full_name
        }
        else {
            Write-Output $file_full_name
            Move-Item -Path $file_full_name -Destination $DstDir -Force
            $new_dst = $DstDir + '\' + $file_short_name
            Out-File -FilePath $LogFile -InputObject "$file_full_name,$new_dst" -Encoding utf8 -Append
        }
    }
}
