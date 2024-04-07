# CSV dosyasının yolu
$csvFilePath = "C:\users.csv"

# Yazılacak metin dosyasının yolu
$outputFilePath = "C:\users.txt"

# Metin dosyasını oluştur
New-Item -Path $outputFilePath -ItemType File -Force | Out-Null

# CSV dosyasını oku
$csvData = Import-Csv -Path $csvFilePath

Add-Content -Path $outputFilePath -Value "config local user`n"

# Her satır için işlem yap
foreach ($row in $csvData) {
    # Kullanıcı adını ve e-postayı al
    $username = $row.username
    $email = $row.email

    # Kodu doldur ve metin dosyasına yaz
    $output = "edit $username`nset two-factor email`nset email-to $email`nnext`n"
    Add-Content -Path $outputFilePath -Value $output
}

Write-Host "İşlem tamamlandı. Sonuçlar '$outputFilePath' dosyasına yazıldı."