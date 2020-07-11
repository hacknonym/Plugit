$CURRENT_PATH = [System.Environment]::CurrentDirectory
$MaxSize = 5

Function SearchInFolder([String]$FolderLocation, [Int]$MaxSize){
	$files = Get-ChildItem $FolderLocation -Recurse -Include *private*, *hide*, *secret*, *discret*, *restrict*, *password*, *credential*, *username*, *important*, *confidential*, *personal*, *privé*, *caché*, *secret*, *discret*, *restreint*, '*mots de passe*', '*mot de passe*', *motdepasse*, *motsdepasse*, *identifiant*, *utilisateur*, *important*, *confidentiel*, *personnel*, *privado*, *ocultar*, *secreto*, *discreto*, *restringir*, *contraseña*, *credencial*, '*nombre de usuario*', *importante*, *confidencial*, *personal*, *privat*, *verstecken*, *geheim*, *diskret*, *einschränken*, *passwort*, *Berechtigungsnachweis*, *Benutzername*, *wichtig*, *vertraulich*, *persönlich*, *privato*, *nascondere*, *segreto*, *discret*, *limitare*, *password*, *credenziali*, '*nome utente*', *importante*, *confidenziali*, *personali* | where {! $_.PSIsContainer}
	$NbFiles = @(Dir $files).Count
	$c = 0

	ForEach($i in $files){
		$percent = $c * 100 / $NbFiles
		$percent2Dec = [math]::Round($percent,2)
		Write-Progress -Activity "Search in Progress" -Status "$percent2Dec% Complete:" -PercentComplete $percent
		$c++

		Write-Host -ForegroundColor Green "[+] FOUND -> '$i'"

		#0 < Size < XMo
		$size = "{0:N0}" -f ((gci $i | measure Length -s).sum / 1Mb)
		If($size -gt 0 -and $size -lt $MaxSize){
			Write-Host -ForegroundColor Yellow -NoNewLine "[i]"
			Write-Host -ForegroundColor White "[$size Mo] File copy inside $CURRENT_PATH\output\search_files\...`n"
			Copy-Item "$i" -Destination "$CURRENT_PATH\output\search_files"
		} ElseIf($size -eq 0){
			$size = "{0:N0}" -f ((gci $i | measure Length -s).sum / 1Kb)
			Write-Host -ForegroundColor Yellow -NoNewLine "[i]"
			Write-Host -ForegroundColor White "[$size Ko] File copy inside $CURRENT_PATH\output\search_files\...`n"
			Copy-Item "$i" -Destination "$CURRENT_PATH\output\search_files"
		} Else{
			Write-Host -ForegroundColor Red -NoNewLine "[x]"
			Write-Host -ForegroundColor White "[$size Mo] File too large`n"
		}
	}
}

Write-Host -ForegroundColor White -NoNewLine "[?] Change the Maximum Size, default("
Write-Host -ForegroundColor Yellow -NoNewLine "$MaxSize Mo"
Write-Host -ForegroundColor White -NoNewLine ") (Y/n)> "
$ChangeMaxSize = Read-Host
If($ChangeMaxSize -Match 'y' -or $ChangeMaxSize -Match 'Y' -or $ChangeMaxSize -Match 'o' -or $ChangeMaxSize -Match 'O'){
	Write-Host -ForegroundColor White -NoNewLine "[?] Specify a new Maximum Size ("
	Write-Host -ForegroundColor Yellow -NoNewLine "Mo"
	Write-Host -ForegroundColor White -NoNewLine ")> "
	$MaxSize = Read-Host
}

Write-Host -ForegroundColor Blue -NoNewLine "[*] "
Write-Host -ForegroundColor Yellow -NoNewLine "Key words"
Write-Host ": private, hide, secret, discret, restrict, password, credential, username, important, confidential, personal, privé, caché, secret, discret, restreint, mots de passe, mot de passe, motdepasse, motsdepasse, identifiant, utilisateur, important, confidentiel, personnel, privado, ocultar, secreto, discreto, restringir, contraseña, credencial, nombre de usuario, importante, confidencial, personal, privat, verstecken, geheim, diskret, einschränken, passwort, Berechtigungsnachweis, Benutzername, wichtig, vertraulich, persönlich, privato, nascondere, segreto, discret, limitare, password, credenziali, nome utente, importante, confidenziali, personali`n"

Write-Host -ForegroundColor Blue -NoNewLine "[*] "
Write-Host -ForegroundColor White -NoNewLine "Search files smaller than "
Write-Host -ForegroundColor Yellow "$MaxSize Mo"
Write-Host -ForegroundColor Blue -NoNewLine "[*] "
Write-Host -ForegroundColor White -NoNewLine "Search in "
Write-Host -ForegroundColor Yellow -NoNewLine "$home "
Write-Host -ForegroundColor White "in progress...`n"
SearchInFolder "$home" $MaxSize

Write-Host -ForegroundColor Green -NoNewLine "[+] "
Write-Host -ForegroundColor White "Appling filter..."
Remove-Item -path $CURRENT_PATH\output\search_files\*.html
Remove-Item -path $CURRENT_PATH\output\search_files\*.css
Remove-Item -path $CURRENT_PATH\output\search_files\*.c
Remove-Item -path $CURRENT_PATH\output\search_files\*.h
Remove-Item -path $CURRENT_PATH\output\search_files\*.o
Remove-Item -path $CURRENT_PATH\output\search_files\*.go
Remove-Item -path $CURRENT_PATH\output\search_files\*.patch
Remove-Item -path $CURRENT_PATH\output\search_files\*.ino
Remove-Item -path $CURRENT_PATH\output\search_files\*.less
Remove-Item -path $CURRENT_PATH\output\search_files\*.pfa
Remove-Item -path $CURRENT_PATH\output\search_files\*.pyc
Remove-Item -path $CURRENT_PATH\output\search_files\*.wsdl
Remove-Item -path $CURRENT_PATH\output\search_files\*.class
Remove-Item -path $CURRENT_PATH\output\search_files\*.ddl
Remove-Item -path $CURRENT_PATH\output\search_files\*.xml
Remove-Item -path $CURRENT_PATH\output\search_files\*.nse

$NumberFiles = @(Dir $CURRENT_PATH\output\search_files).Count
$TotalSize = "{0:N0} Mo" -f ((gci $CURRENT_PATH\output\search_files | measure Length -s).sum / 1Mb)

Write-Host -ForegroundColor Yellow -NoNewLine "[i] "
Write-Host -ForegroundColor White -NoNewLine "Number of recovered files ("
Write-Host -ForegroundColor Yellow -NoNewLine "$NumberFiles"
Write-Host -ForegroundColor White -NoNewLine ")["
Write-Host -ForegroundColor Yellow -NoNewLine "$TotalSize"
Write-Host -ForegroundColor White "]"

Write-Host -ForegroundColor White -NoNewLine "[?] Apply a second filter (Y/n)> "
$filter2 = Read-Host

If($filter2 -Match 'y' -or $filter2 -Match 'Y' -or $filter2 -Match 'o' -or $filter2 -Match 'O'){
	Remove-Item -path $CURRENT_PATH\output\search_files\*.pl
	Remove-Item -path $CURRENT_PATH\output\search_files\*.rb
	Remove-Item -path $CURRENT_PATH\output\search_files\*.py
	Remove-Item -path $CURRENT_PATH\output\search_files\*.sh
	Remove-Item -path $CURRENT_PATH\output\search_files\*.js
	Remove-Item -path $CURRENT_PATH\output\search_files\*.ps1
	Remove-Item -path $CURRENT_PATH\output\search_files\*.json
	Remove-Item -path $CURRENT_PATH\output\search_files\*.smali
	Remove-Item -path $CURRENT_PATH\output\search_files\*.php
	Remove-Item -path $CURRENT_PATH\output\search_files\*.java
	Remove-Item -path $CURRENT_PATH\output\search_files\*.ico
	
	$NumberFiles = @(Dir $CURRENT_PATH\output\search_files).Count
	$TotalSize = "{0:N0} Mo" -f ((gci $CURRENT_PATH\output\search_files | measure Length -s).sum / 1Mb)

	Write-Host -ForegroundColor Yellow -NoNewLine "[i] "
	Write-Host -ForegroundColor White -NoNewLine "Number of recovered files ("
	Write-Host -ForegroundColor Yellow -NoNewLine "$NumberFiles"
	Write-Host -ForegroundColor White -NoNewLine ")["
	Write-Host -ForegroundColor Yellow -NoNewLine "$TotalSize"
	Write-Host -ForegroundColor White "]"
}
