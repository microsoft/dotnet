# Script to force the .NET Framework optimization service to run at maximum speed.

$isWin8Plus = [Environment]::OSVersion.Version -ge (new-object 'Version' 6,2)
$dotnetDir = [environment]::GetEnvironmentVariable("windir","Machine") + "\Microsoft.NET\Framework"
$dotnet2 = "v2.0.50727"
$dotnet4 = "v4.0.30319"

$dotnetVersion = if (Test-Path ($dotnetDir + "\" + $dotnet4 + "\ngen.exe")) {$dotnet4} else {$dotnet2}

$ngen32 = $dotnetDir + "\" + $dotnetVersion +"\ngen.exe"
$ngen64 = $dotnetDir + "64\" + $dotnetVersion +"\ngen.exe"
$ngenArgs = " executeQueuedItems"
$is64Bit = Test-Path $ngen64


#32-bit NGEN -- appropriate for 32-bit and 64-bit machines
Write-Host("Requesting 32-bit NGEN") 
Start-Process -wait $ngen32 -ArgumentList $ngenArgs

#64-bit NGEN -- appropriate for 64-bit machines

if ($is64Bit) {
    Write-Host("Requesting 64-bit NGEN") 
    Start-Process -wait $ngen64 -ArgumentList $ngenArgs
}

#AutoNGEN for Windows 8+ machines

if ($isWin8Plus) {
    Write-Host("Requesting 32-bit AutoNGEN -- Windows 8+") 
    schTasks /run /Tn "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
}

#64-bit AutoNGEN for Windows 8+ machines

if ($isWin8Plus -and $is64Bit) {
    Write-Host("Requesting 64-bit AutoNGEN -- Windows 8+") 
    schTasks /run /Tn "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
}
