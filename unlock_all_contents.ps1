# Get the list of locked files and their IDs
$lockedFiles = git lfs locks | ForEach-Object {
    # Split each line by whitespace
    $parts = $_ -split '\s+'
    # The last part is the ID with prefix "ID:"
    $parts[-1].Replace("ID:", "")
}

Write-Host "IDs of locked files:"
$lockedFiles | ForEach-Object {
    Write-Host $_
}

# Unlock each file by ID
$lockedFiles | ForEach-Object {
    $unlockCommand = "git lfs unlock -f --id=$_"
    Invoke-Expression $unlockCommand
    Write-Host "Unlocked file with ID: $_"
}