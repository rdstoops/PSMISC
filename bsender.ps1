#Adds domain to O365 spam blacklist
$policy = *Policy Name*
$address = Read-host -prompt 'Email Address to block'
$FilterPolicy = (Get-HostedContentFilterPolicy -Identity $policy)
Set-HostedContentFilterPolicy -Identity $Policy -BlockedSenders @{Add=$address}


	
