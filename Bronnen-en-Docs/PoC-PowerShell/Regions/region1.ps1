# Haalt een lijst van alle domeinen op die beschikbaar zijn in de Office 365-omgeving.
# Sla de Id en de AvailabilityStatus op van elk domein op in de variabele $domains.
$domains = (Get-MgDomain -Select Id,AvailabilityStatus)

Write-Host "=== Domains ==="

# Maakt een loop waarin elk domein in de $domains variabele wordt verwerkt. 
# Voor elk domein controleert de loop of de AvailabilityStatus waarde van het domein beschikbaar is of niet.
foreach ($domain in $domains) {
    if ($domain.AvailabilityStatus) 
        { Write-Host "Domain: $($domain.Id) - Status: $($domain.AvailabilityStatus)" }
    else { Write-Host "Domain: $($domain.Id) - Status: Not available" }
}

Write-Host "GRAND TOTAL: $($domains.count)"