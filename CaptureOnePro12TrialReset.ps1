
# For Capture One Pro 12 we need to reset a reg key value with the name of 1796287996. 
# It is located somewhere in the random directory under the HKEY_CURRENT_USER\Software\Classes\<random_directory> 
# So fistly, we need to find the random directory name and then reset the value.
$KeyName = "1796287996"
$KeyValue = ""

Write-Host Looking for the $KeyName registry value path -ForegroundColor Cyan

# Change the below to this loop: 
# https://social.technet.microsoft.com/Forums/ie/en-US/d41fb94c-9f6e-4d31-be57-e5676ffb8454/ps-script-to-traverse-entire-registry-search-values-then-delete-them?forum=winserverpowershell

$keys = Reg query HKEY_CURRENT_USER\Software\Classes /v 1796287996 /s
$CO_Key_Path = $keys[1] # should be 2nd string 
Write-Host The path is  -ForegroundColor Cyan
Write-Host $CO_Key_Path -ForegroundColor Magenta
Write-Host Reseting the registry value... -ForegroundColor Cyan

#Reg add $key_path /v 1796287996 /f /d ""
New-ItemProperty -Path $CO_Key_Path.Replace("HKEY_CURRENT_USER","HKCU:") -Name $KeyName -Value $value -Force


Write-Host Done! -ForegroundColor Green
Pause