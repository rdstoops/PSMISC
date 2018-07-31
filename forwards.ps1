#Show OWA rules that forward mail
$mailboxes = get-mailbox -ResultSize unlimited

ForEach ($MB in $Mailboxes) {
    Try {
        Get-InboxRule -Mailbox $MB.Alias -WarningAction SilentlyContinue |
        Where {$_.ForwardTo -ne $null -or $_.RedirectTo -ne $null} |
        select mailboxownerid,name,description
    }
    Catch {
        write-Host -ForeGroundColor "Magenta" "$_"
    }
}