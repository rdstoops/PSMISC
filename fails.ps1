#Searches the past day's O365 audit logs for failed attempts
$auditEventsForUser = Search-UnifiedAuditLog -EndDate $((Get-Date)) -StartDate $((Get-Date).AddDays(-1)) -Operations UserLoginFailed -resultsize 5000
$ConvertedOutput = $auditEventsForUser | Select-Object -ExpandProperty AuditData | ConvertFrom-Json
$ConvertedOutput | Select-Object CreationTime,UserId,Operation,Workload,ClientIP | Export-Csv "$(get-date -f yyyyMMdd).csv" -NoTypeInformation -Append

