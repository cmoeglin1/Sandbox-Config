$sandboxlocation = "C:\Sandbox"
$desktopShortcut = $true
$swiftTarget = "$sandboxLocation\sysmonconfig-export.xml"
$setupTarget = "$sandboxLocation\sandbox-setup.ps1"
$swiftURI = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"
$setupURI = "https://raw.githubusercontent.com/cmoeglin1/Sandbox-Config/master/sandbox-setup.ps1"
$wsbURI = "https://raw.githubusercontent.com/cmoeglin1/Sandbox-Config/master/Sandbox.wsb"
$wsbTarget = "$sandboxLocation\Sandbox.wsb"
$npptarget = "$sandboxLocation\npp.exe"
$sysTarget = "$sandboxLocation\Sysinternals"
$nppuri = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.1/npp.8.1.1.Installer.exe"
#$nppuri = "https://notepad-plus-plus.org/repository/7.x/7.6.6/npp.7.6.6.Installer.x64.exe"

$wc = New-Object -TypeName System.Net.WebClient
if (test-path $sandboxLocation)
{
	Remove-Item $sandboxLocation -force -recurse
}
New-Item $sandboxLocation -itemtype directory
New-Item $sysTarget -itemtype directory
Copy-Item \\live.sysinternals.com\tools\* $sysTarget -Recurse
$wc.DownloadFile($swiftURI,$swiftTarget)
$wc.DownloadFile($setupURI,$setupTarget)
$wc.DownloadFile($wsbURI,$wsbTarget)
$wc.downloadfile($nppuri,$npptarget)
if ($desktopShortcut) {
	$DesktopPath = [Environment]::GetFolderPath("Desktop")
	Copy-Item -Path $wsbTarget "$DesktopPath\Sandbox.wsb"
}