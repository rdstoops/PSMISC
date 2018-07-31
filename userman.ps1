#This function changes the Manager attribute in AD such that all the direct reports for one Manager are moved to another Manager

$username = read-host -prompt "Manager Name"
$user = get-aduser -identity $username
$udn = $user.distinguishedname
$changes = Get-ADUser -Filter { Manager -eq $udn }
echo ""
echo "Current Direct Reports"
Get-ADUser -Filter { Manager -eq $udn } -Properties telephoneNumber | ft Name, telephoneNumber
$newman = read-host "New Manager Name"
foreach ($change in $changes)
{
	set-aduser $change.samaccountname -manager $newman
}
echo "" 
echo "New Manager Direct Reports"
Get-ADUser -Filter { Manager -eq $newman } -Properties telephoneNumber | ft Name, telephoneNumber



