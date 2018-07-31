#Manipulate sharing and directory for printers
#When run on the printer server, this will perform the option for all printers

$printers = gwmi win32_printer
foreach ($printer in $printers)
{
   #Setting this to $true shares the printer
   $printer.shared = $false
   #Setting this to $true lists the printer in the directory
   $printer.published = $false
   $printer.put()
}