Out-File $env:USERPROFILE\desktop\driverhelp.txt
$obj = Get-CimInstance win32_PnPSignedDriver | where deviceclass -like 'display' | where manufacturer -notlike '*INTEL*' | Select-Object -Property DeviceID
$objTwo = "%NVIDIA_DEV." + ($obj."DeviceID").Substring(17,4) + "." + ($obj."DeviceID").Substring(29,4) + "." + ($obj."DeviceID").Substring(33,4) + "% = Section097, " + $obj."DeviceID".Substring(0, $obj."DeviceID".lastIndexOf('\'))
$objThree = "NVIDIA_DEV." + ($obj."DeviceID").Substring(17,4) + "." + ($obj."DeviceID").Substring(29,4) + "." + ($obj."DeviceID").Substring(33,4) + ' = "NVIDIA Quadro M2000M"'
Write-Host "IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!!"
Write-Host "IMPORTANT!!                                                                                                 IMPORTANT!!"
Write-Host "IMPORTANT!!                                                                                                 IMPORTANT!!"
Write-Host "IMPORTANT!! Replace 'Section97' with another section that is already in the nvdm.inf/nvdmwi.inf-file.       IMPORTANT!!"
Write-Host "IMPORTANT!!                                                                                                 IMPORTANT!!"
Write-Host "IMPORTANT!!                                                                                                 IMPORTANT!!"
Write-Host "IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!! IMPORTANT!!"
Write-Host " "
Write-Host $objTwo
Write-Host " "
Write-Host $objThree
$path = Get-Location
"Replace 'Section97' with another section that is already in the nvdm.inf/nvdmwi.inf-file." | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
$objTwo | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
"Just add this at the end of the nvdm.inf/nvdmwi.inf-file by the other with the same format." | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
" " | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append
 
$objThree | Out-File $env:USERPROFILE\desktop\driverhelp.txt -append