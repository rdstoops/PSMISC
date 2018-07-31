#Gives Password Expiration for user
$user = Read-host -prompt 'User?'

Get-ADUser $user -Properties DisplayName,msDS-UserPasswordExpiryTimeComputed | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} 

