#Start Logging of session
$datetime = get-date -format yyyy-MM-dd-hhmm
$logpath= "C:\temp\CiscoCert_"+$datetime+".powershell_log"
Start-Transcript -path $logpath
#URL For Download Target
$URIRequest = "https://d36u8deuxga9bo.cloudfront.net/certificates/Cisco_Umbrella_Root_CA.cer"
#Where to save the file
$OutputFile = "C:\temp\UbmrellaRootCA.cer"
#Create powershell download request to target
Invoke-Webrequest -Uri $URIRequest -OutFile $OutputFile
#Import the certificate downloaded to the Trusted Root Certificate Authority of the Local Machine
certutil -enterprise -f -v -addstore "Root" "$OutputFile"
Stop-Transcript
