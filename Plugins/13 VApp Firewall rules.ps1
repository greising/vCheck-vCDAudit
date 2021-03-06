# Start of Settings 
# End of Settings

Foreach ($vApp in $CIvApp) {
	Foreach ($Network in ($vApp.ExtensionData.Section | Where {$_.GetType().Name -eq "NetworkConfigSection" }).NetworkConfig) { 
		If ($Network.Configuration.Features) {
			$Details = $Network.Configuration.Features | Where { $_.GetType().Name -eq "FirewallService" } | Select -ExpandProperty FirewallRule
			If ($Details.Count -gt 0) {
				$Display = "None"
				$Title = "Firewall rules for $($VApp.Name) Network: $($Network.NetworkName)"
				$Header =  "Firewall rules for $($VApp.Name) Network: $($Network.NetworkName)"
				$Comments = ""
				$FWReport = @()
				$Details | Foreach {
					$Report = "" | Select IsEnabled, Description, Policy, Protocols, Port, DestinationIp, SourcePort, SourceIp, Direction, EnableLogging
					$Report.IsEnabled = $_.IsEnabled
					$Report.Description = $_.Description
					$Report.Policy = $_.Policy
					$Protocols = ""
					If ($_.Protocols.Any) {
						$Protocols += "Any"
					}
					If ($_.Protocols.Icmp) {
						$Protocols += " ICMP"
					}
					If ($_.Protocols.Tcp) {
						$Protocols += " Tcp"
					}
					If ($_.Protocols.Udp) {
						$Protocols += " Udp"
					}
					$Report.Protocols = $Protocols
					If ($_.Port -eq "-1") {
						$Port = "All"
					} Else {
						$Port = $_.Port
					}
					$Report.Port = $Port
					$Report.DestinationIp = $_.DestinationIP
					If ($_.SourcePort -eq "-1") {
						$SourcePort = "All"
					} Else {
						$SourcePort = $_.SourcePort
					}
					$Report.Port = $SourcePort
					$Report.SourceIp = $_.SourceIP
					$Report.Direction = $_.Direction
					$Report.EnableLogging = $_.EnableLogging
					$FWReport += $Report
				}
		      	$script:MyReport += Get-CustomHeader $Header $Comments
			 	$script:MyReport += Get-HTMLTable $FWReport
		     	$script:MyReport += Get-CustomHeaderClose
			}
		}
	}
}

$Title = "vApp Firewall Rules"
$Header =  "List of all vApp Firewall Rules"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"

