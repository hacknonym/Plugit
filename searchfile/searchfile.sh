#!/bin/bash
#coding:utf-8
#title:searchfile.sh
#author:hacknonym
#launch:./searchfile.sh [-v]  |or|   bash searchfile.sh [-v]   |or|   . searchfile.sh [-v]

#terminal text color code
white='\e[0;37;1m'
grey='\e[0;37m'
greenb='\e[0;32;1m'
redb='\e[0;31;1m'
yellowb='\e[0;33;1m'
blueb='\e[0;34;1m'

CURRENT_PATH=$(pwd)

function type(){
  type_element=$(file "$1" | cut -d ':' -f 2 | cut -c 2-)
  if [ "$type_element" = "directory" ] ; then
    return 2 #folder
  else
    return 1 #file
  fi
}

function search(){
  for element in $(ls -lF "$1" | grep -e ":" | cut -d ':' -f 2 | cut -c 4- | tr ' ' 'µ') ; do
    correct_element=$(echo -e "$element" | tr 'µ' ' ')
    type "$1/$correct_element"
    if [ $? -eq 1 ] ; then
      file=$(echo -e "$1/$correct_element" | tr '@' ' ' | tr '|' ' ' | tr '=' ' ' | tr '*' ' ')
      if [ "$verbose" = "1" ] ; then
        echo -e "$blueb[*]$grey File -> '$file'"
      fi
      found "$file"
    else
      folder_func "$1/$correct_element"
    fi
  done
}

function folder_func(){
  for folder in $(ls -lF "$1" | grep -e ":" | cut -d ':' -f 2 | cut -c 4- | tr ' ' 'µ') ; do
    correct_folder=$(echo -e "$folder" | tr 'µ' ' ')
    type "$1$correct_folder"
    if [ $? -eq 1 ] ; then
      file=$(echo -e "$1$correct_folder" | tr '@' ' ' | tr '|' ' ' | tr '=' ' ' | tr '*' ' ')
      if [ "$verbose" = "1" ] ; then
        echo -e "$blueb[*]$grey File -> '$file'"
      fi
      found "$file"
    else
      if [ "$verbose" = "1" ] ; then
        echo -e "$blueb[*]$grey Folder -> '$1'"
      fi
      folder_func "$1$correct_folder"
    fi
  done
}

function found(){
  file=$(echo -e "$1" | grep -iE "$keywords")
  if [ ! -z "$file" ] ; then
    echo -e "$greenb[+] FOUND -> '$file'$grey"
    size_type=$(ls -lh $file | cut -d ' ' -f 5)
    if echo -e "$size_type" | grep -e "K" 1> /dev/null ; then
      size=$(echo -e "$size_type" | cut -d 'K' -f 1 | cut -d ',' -f 1)
      echo -e "$yellowb[i]$grey[$size_type] File copy inside $CURRENT_PATH/output/..."
      cp -f $1 $CURRENT_PATH/output/

    elif echo -e "$size_type" | grep -e "M" 1> /dev/null ; then
      size=$(echo -e "$size_type" | cut -d 'M' -f 1 | cut -d ',' -f 1)
      #0 < Size < 5Mo
      if [ $size -gt 0 -a $size -lt 5 ] ; then
        echo -e "$yellowb[i]$grey[$size_type] File copy inside $CURRENT_PATH/output/..."
        cp -f $1 $CURRENT_PATH/output/
      fi

    elif echo -e "$size_type" | grep -E "G|T" 1> /dev/null ; then
      echo -e "$redb[x]$grey File too large"

    else
      echo -e "$yellowb[i]$grey[$size_type o] File copy inside $CURRENT_PATH/output/..."
      cp -f $1 $CURRENT_PATH/output/
    fi
  fi
}

if [ "$1" = "-v" -o "$1" = "--verbose" ] ; then
  verbose=1
fi

keyEN="private|hide|secret|discret|restrict|password|credential|username|important|confidential|personal"
keyFR="privé|caché|secret|discret|restreint|mots de passe|mot de passe|motdepasse|motsdepasse|identifiant|utilisateur|important|confidentiel|personnel"
keyES="privado|ocultar|secreto|discreto|restringir|contraseña|credencial|nombre de usuario|importante|confidencial|personal"
keyDE="privat|verstecken|geheim|diskret|einschränken|passwort|Berechtigungsnachweis|Benutzername|wichtig|vertraulich|persönlich"
keyIT="privato|nascondere|segreto|discret|limitare|password|credenziali|nome utente|importante|confidenziali|personali"
keyRU="частное|скрыть|секрет|дискретные|ограничить|пароль|удостоверение|Имя пользователя|важно|конфиденциальные|личный"
keyCH="私人|隱藏|秘密|離散|限制|密碼|憑據|用戶名|重要|機密|個人"

keywords="$keyEN|$keyFR|$keyES|$keyDE|$keyIT|$keyRU|$keyCH"
echo -e "$blueb[*]$grey$yellowb Key words$grey: $keywords\n"

echo -e "$blueb[*]$grey Search files smaller than$white 5Mo$grey"
echo -e "$blueb[*]$grey Search in $yellowb$HOME$grey"
search "$HOME"
echo -e "$blueb[*]$grey Search in $yellowb/var/www/html$grey"
search "/var/www/html"
echo -e "$blueb[*]$grey Search in $yellowb/media$grey"
search "/media"

echo -e "$greenb[+]$grey Appling filter..."
rm -f $CURRENT_PATH/output/*.html
rm -f $CURRENT_PATH/output/*.css
rm -f $CURRENT_PATH/output/*.c
rm -f $CURRENT_PATH/output/*.h
rm -f $CURRENT_PATH/output/*.o
rm -f $CURRENT_PATH/output/*.go
rm -f $CURRENT_PATH/output/*.patch
rm -f $CURRENT_PATH/output/*.ino
rm -f $CURRENT_PATH/output/*.less
rm -f $CURRENT_PATH/output/*.pfa
rm -f $CURRENT_PATH/output/*.pyc
rm -f $CURRENT_PATH/output/*.wsdl
rm -f $CURRENT_PATH/output/*.class
rm -f $CURRENT_PATH/output/*.ddl
rm -f $CURRENT_PATH/output/*.xml
rm -f $CURRENT_PATH/output/*.nse

number_file=$(
  c=0
  for i in $(ls -lA $CURRENT_PATH/output/ | grep -e ":" | cut -d ':' -f 2 | cut -c 4-) ; do
    c=$(($c + 1))
  done
  echo -e "$c"
)
total_size=$(ls -lh $CURRENT_PATH/output/ | sed -n '1 p' | cut -d ' ' -f 2)
echo -e "$yellowb[i]$grey Number of recovered files ($yellowb$number_file$grey)[$yellowb$total_size$grey]"

read -p "[?] Apply a second filter (Y/n)> " -n 1 -e option
if [[ $option =~ ^[YyOo]$ ]] ; then
  echo -e "$greenb[+]$grey Appling 2nd filter..."
  rm -f $CURRENT_PATH/output/*.pl
  rm -f $CURRENT_PATH/output/*.rb
  rm -f $CURRENT_PATH/output/*.py
  rm -f $CURRENT_PATH/output/*.sh
  rm -f $CURRENT_PATH/output/*.js
  rm -f $CURRENT_PATH/output/*.ps1
  rm -f $CURRENT_PATH/output/*.json
  rm -f $CURRENT_PATH/output/*.smali
  rm -f $CURRENT_PATH/output/*.php
  rm -f $CURRENT_PATH/output/*.java
  rm -f $CURRENT_PATH/output/*.ico

  number_file=$(
    c=0
    for i in $(ls -lA $CURRENT_PATH/output/ | grep -e ":" | cut -d ':' -f 2 | cut -c 4-) ; do
      c=$(($c + 1))
    done
    echo -e "$c"
  )
  total_size=$(ls -lh $CURRENT_PATH/output/ | sed -n '1 p' | cut -d ' ' -f 2)
  echo -e "$yellowb[i]$grey Number of recovered files ($yellowb$number_file$grey)[$yellowb$total_size$grey]"
fi
