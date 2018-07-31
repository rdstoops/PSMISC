#Restores deleted AD object, AD Recycle Bin must be turned on
$name = read-host -prompt "Name of deleted object"
get-adobject -filter {displayname -eq $name} -IncludeDeletedObjects | Restore-ADObject