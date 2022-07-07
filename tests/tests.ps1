$ok = $True

$expected_files = @(".gitkeep", "ghjk.txt", "main.py", "log.csv")
#$files = (Get-ChildItem -Path ".\tests\dst\")
$files = (Get-ChildItem -Path "C:\Users\predseda\Desktop\dst\")
foreach($file in $files) {
    $file_name = $file.Name
    if(-not ($file_name -in $expected_files)) {
        Write-Error -Message "$file should not be in .\tests\dst"
        $ok = $False
    }
    else {
        $is_file = (Test-Path -Path "$file" -PathType Leaf)
        if($is_file -eq $False) {
            Write-Error -Message "$file_name should be a file, not a directory"
            $ok = $False
        }
    }
}

if($ok -eq $False) {
    Exit 42
}
