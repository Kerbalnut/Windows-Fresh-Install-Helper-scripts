
# Commands to help get all powershell cmdlets for updating/modifying Notepad++ .xml Style Configuration files.

$AllCommands = Get-Command | Sort-Object -Property Name | Where-Object Name -like *-* | Where-Object Source -ne "posh-git" | Where-Object Source -ne "Posh-GitHub" | Where-Object Source -notlike "*Boxstarter*" | Select-Object -Property Name

$AllCommands = Get-Command | Sort-Object -Property Name | `
    Where-Object Name -like *-* | `
    Where-Object Source -ne "posh-git" | `
    Where-Object Source -ne "Posh-GitHub" | `
    Where-Object Source -notlike "*Boxstarter*" | `
    Select-Object -Property Name

$NppDefaultCmdlets = @('add-content','add-history','add-member','add-pssnapin','clear-content','clear-item','clear-itemproperty','clear-variable','compare-object','convertfrom-securestring','convert-path','convertto-html','convertto-securestring','copy-item','copy-itemproperty','export-alias','export-clixml','export-console','export-csv','foreach-object','format-custom','format-list','format-table','format-wide','get-acl','get-alias','get-authenticodesignature','get-childitem','get-command','get-content','get-credential','get-culture','get-date','get-eventlog','get-executionpolicy','get-help','get-history','get-host','get-item','get-itemproperty','get-location','get-member','get-pfxcertificate','get-process','get-psdrive','get-psprovider','get-pssnapin','get-service','get-tracesource','get-uiculture','get-unique','get-variable','get-wmiobject','group-object','import-alias','import-clixml','import-csv','invoke-expression','invoke-history','invoke-item','join-path','measure-command','measure-object','move-item','move-itemproperty','new-alias','new-item','new-itemproperty','new-object','new-psdrive','new-service','new-timespan','new-variable','out-default','out-file','out-host','out-null','out-printer','out-string','pop-location','push-location','read-host','remove-item','remove-itemproperty','remove-psdrive','remove-pssnapin','remove-variable','rename-item','rename-itemproperty','resolve-path','restart-service','resume-service','select-object','select-string','set-acl','set-alias','set-authenticodesignature','set-content','set-date','set-executionpolicy','set-item','set-itemproperty','set-location','set-psdebug','set-service','set-tracesource','set-variable','sort-object','split-path','start-service','start-sleep','start-transcript','stop-process','stop-service','stop-transcript','suspend-service','tee-object','test-path','trace-command','update-formatdata','update-typedata','where-object','write-debug','write-error','write-host','write-output','write-progress','write-verbose','write-warning')

$NoDefaults = @()

ForEach ($cmdlet in $AllCommands) {If ($NppDefaultCmdlets -notcontains $cmdlet.Name){$NoDefaults += $cmdlet.Name}}


$AllCommands.Count
$NppDefaultCmdlets.Count
$NoDefaults.Count

$AllCommands.GetType()
$NppDefaultCmdlets.GetType()
$NoDefaults.GetType()


# Convert our array to a string separated by spaces:
$FormattedReadyOutput = $NoDefaults -join ' '

# Char limit for "User-defined keywords" in Style Configurator is 30,000
$FormattedReadyOutput.Length



$AllCommands | Out-File "$Home\Desktop\all-cmdlets.txt"

$NoDefaults | Out-File "$Home\Desktop\all-cmdlets.txt"

$FormattedReadyOutput | Out-File "$Home\Desktop\all-cmdlets.txt"




