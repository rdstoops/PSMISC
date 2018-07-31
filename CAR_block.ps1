#Powershell must be connected to vCenter
#Add IP to O365 ClientAccessRule

$rulename = *Client Access Rule Name*
$BlockedIP = Read-host -prompt 'IP Address to block'

Set-ClientAccessRule -identity $rulename -AnyOfClientIPAddressesOrRanges @{Add=$BlockedIP} -confirm:$false
echo "Modifying $rulename to add $BlockedIP"
echo ""
echo "Testing access from $BlockedIP"
echo ""
test-clientaccessrule -authentication basic -Protocol OutlookWebApp -user *testuser* -Remoteaddress $BlockedIP -remoteport 443
echo ""
echo "Full List:"
$rule = get-clientaccessrule -identity $rulename
echo $rule.anyofclientipaddressesorranges