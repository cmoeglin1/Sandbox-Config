if (test-path C:\Sandbox)
{
	del C:\Sandbox -force -recurse
}
copy \\live.sysinternals.com\tools\* C:\Sandbox\SysinternalsSuite
wget https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml > C:\Sandbox\sysmonconfig-export.xml
wget https://raw.githubusercontent.com/cmoeglin1/Sandbox-Config/master/sandbox-setup.ps1 > C:\Sandbox\sandbox-setup.ps1