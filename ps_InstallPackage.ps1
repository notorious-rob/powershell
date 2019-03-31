# Goal is to install on multiple machines using a local context
# Initial testing is using WinZip

# Define variables

Write-Host "Enter computername"
$Comp = Read-Host

$RegKey64 = "HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\WinZip"
$RegKey32 = "HKLM:\SOFTWARE\WOW6432Node\WinZip"

$Pkg = "C:\SOURCE\winzip23-downwz.exe"

# Function to install package if registry key is not present
function install_pkg {
        Start-Process -Wait -FilePath $pkg -ArgumentList '/S' 
    }
   
# Search for package based on registry key

If (((Test-Path -Path $RegKey64) -eq $false) -or ((Test-Path -Path $RegKey32) -eq $false)) {
    install_pkg
    } 

# Create new session and execute function

