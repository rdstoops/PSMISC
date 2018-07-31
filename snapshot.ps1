#Return all VM snapshots
get-vm | get-snapshot | select vm, name, description, created, sizegb

