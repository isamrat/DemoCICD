$files = Get-ChildItem args[0]
foreach ($file in $files)
{
    if ($file.length -gt args[1])
    {
        Write-Output $file
    }
}
