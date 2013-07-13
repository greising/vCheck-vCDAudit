# Start of Settings 
# End of Settings

$CIUser | Select Org, Name, FullName, Description, @{N="Role";E={$_.ExtensionData.Role.Name}} | Sort Org, Name

$Title = "Org Users and Roles"
$Header =  "List of all Org Users"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
