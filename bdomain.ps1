#Adds domain to O365 spam blacklist
$policy = *Policy Name*
$address = Read-host -prompt 'Domain to block'
$FilterPolicy = (Get-HostedContentFilterPolicy -Identity $policy)
Set-HostedContentFilterPolicy -Identity $policy -BlockedSenderDomains @{Add=$address}

	
