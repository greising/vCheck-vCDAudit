# Start of Settings 
# End of Settings

$OrgvDC | Select Org, Name, AllocationModel, Enabled, CPUUsedGhz, CPULimitGhz, MemoryUsedGB, MemoryLimitGB, StorageUsedGB, StorageLimitGB

$Title = "Org VDCs per Org"
$Header =  "List of all Org VDCs per Org"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
