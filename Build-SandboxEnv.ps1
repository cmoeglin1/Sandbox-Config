$sandboxlocation = "C:\Sandbox"
$desktopShortcut = $true
$swiftTarget = "$sandboxLocation\sysmonconfig-export.xml"
$setupTarget = "$sandboxLocation\sandbox-setup.ps1"
$swiftURI = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"
$setupURI = "https://raw.githubusercontent.com/cmoeglin1/Sandbox-Config/master/sandbox-setup.ps1"
$npptarget = "$sandboxLocation\npp.exe"
$nppuri = "https://notepad-plus-plus.org/repository/7.x/7.6.6/npp.7.6.6.Installer.x64.exe"

$wc = New-Object -TypeName System.Net.WebClient
if (test-path $sandboxLocation)
{
	Remove-Item $sandboxLocation -force -recurse
}
Copy-Item \\live.sysinternals.com\tools\* $sandboxLocation\SysinternalsSuite
$wc.DownloadFile($swiftURI,$swiftTarget)
$wc.DownloadFile($setupURI,$setupTarget)
$wc.downloadfile($nppuri,$npptarget)
