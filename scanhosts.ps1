#Scans all hosts in vCenter and returns a list with version and build
$vmhosts = get-vmhost
foreach ($vmhost in $vmhosts)
{
echo $vmhost
Scan-Inventory -Entity $vmhost -Confirm:$false
}
get-vmhost | ft name,version,build
