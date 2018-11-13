#Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Modules-Public\*.ps1 -ErrorAction SilentlyContinue )
# $Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
# Foreach($import in @($Public + $Private))
Foreach($import in @($Public + $Private))
{
	Try
	{
		. $import.fullname
	}
	Catch
	{
		Write-Error -Message "Failed to import function $($import.fullname): $_"
	}
}

# Export the Public modules
Export-ModuleMember -Function $Public.Basename