$filePath = $(Get-Location).Path + "\Display.Driver\nvdmwi.inf";

$devLine = (Select-String -Path $filePath -Pattern "%NVIDIA_DEV." | Select-Object -Last 1).Line.replace('I\V', 'I\\V')
$devLineTwo = (Select-String -Path $filePath -Pattern "NVIDIA Quadro M2000M" | Select-Object -Last 1).Line

Write-Host $devLine
Write-Host $devLineTwo

$device 	= Get-CimInstance win32_PnPSignedDriver | where deviceclass -like 'display' | where manufacturer -notlike '*INTEL*' | Select-Object -Property DeviceID
$sectionLine	= "%NVIDIA_DEV." + ($device."DeviceID").Substring(17,4) + "." + ($device."DeviceID").Substring(29,4) + "." + ($device."DeviceID").Substring(33,4) + "% = Section097, " + $device."DeviceID".Substring(0, $device."DeviceID".lastIndexOf('\')) + "; You added this"
$stringsLine 	= "NVIDIA_DEV." + ($device."DeviceID").Substring(17,4) + "." + ($device."DeviceID").Substring(29,4) + "." + ($device."DeviceID").Substring(33,4) + ' = "NVIDIA Quadro M2000M"; You added this'

$Pattern = "$devLine"
[System.Collections.ArrayList]$file = Get-Content $filePath
$insert = @()

for ($i=0; $i -lt $file.count; $i++) {
  if ($file[$i] -match $pattern) {
    $insert += $i+1
  }
}

$insert | ForEach-Object { $file.insert($_,$sectionLine) }

Set-Content $filePath $file

$Pattern = "$devLineTwo"
[System.Collections.ArrayList]$file = Get-Content $filePath
$insert = @()

for ($i=0; $i -lt $file.count; $i++) {
  if ($file[$i] -match $pattern) {
    $insert += $i+1
  }
}

$insert | ForEach-Object { $file.insert($_,$devLineTwo) }

Set-Content $filePath $file



