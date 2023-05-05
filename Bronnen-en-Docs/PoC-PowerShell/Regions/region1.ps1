$domains = (Get-MgDomain -Select Id,AvailabilityStatus)

Write-Host "=== Domains ==="
foreach ($domain in $domains) {
    if ($domain.AvailabilityStatus) { Write-Host "Domain: $($domain.Id) - Status: $($domain.AvailabilityStatus)" }
    else { Write-Host "Domain: $($domain.Id) - Status: Not available" }
}
Write-Host "GRAND TOTAL: $($domains.count)"