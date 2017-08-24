
function Admin 
{
	Start-Process powershell -Verb runAs
}

function Test-Admin
{  
	$user = [Security.Principal.WindowsIdentity]::GetCurrent();
	(New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

function Sweden
{
	if (Test-Admin)
	{
		openvpn.exe "C:\Program Files\OpenVPN\config\se.openvpn.frootvpn.ovpn"
	}
	else
	{
		echo "You must run this command in an elevated shell"
	}
}

if (Test-Admin)
{
	echo "This shell is in administor mode"
}
else
{
	echo "This shell is NOT in administrator mode"
}

