﻿cls
# nasrat na facebooku
[string] $text = Read-Host -Prompt "zadej text"

#$text = "čuráku"
$file_output = $text + ".txt"
#$text = "mrdko"

#echo $text
$d_text = $text.Length-1
#echo $d_text

$maska = "                                                  "
$d_maska = $maska.Length-1
#echo $d_maska

$pole_out = @()

for ($opakuj = 1; $opakuj -le 10; $opakuj++){

<# budou tako 4 zpusoby zapsani textu
 1
 2
 3

  1
   2
    3

    1
   2
  3

  1 
   2
  3 ( no repeat -1,1 or 1,-1 )
#>


#$rnd_maska = Get-Random -Minimum 0 -Maximum
#$pole_out = @()

$rnd_zpusob = Get-Random -Minimum 1 -Maximum 5
#echo $rnd_zpusob
#$rnd_zpusob = 4 # testovaci

# zpusob 1
if ( $rnd_zpusob -eq  1 ){
#echo "zde-1"
$rnd_od_kraje = Get-Random -Minimum 0 -Maximum 10

for ($bb = 0; $bb -le $d_text; $bb++){
[string] $znak = $text[$bb]
#echo $znak"<"
$radek = $maska.Substring(0,$rnd_od_kraje)
$radek += $znak

$rnd_do_konce = Get-Random -Minimum 0 -Maximum $d_maska # tady vzdy jina delka
$radek += $maska.Substring(0,$rnd_do_konce)
#$radek += "." # aby bylo videk konec radku
$pole_out += $radek
}
}


# zpusob 2
if ( $rnd_zpusob -eq 2 ){
#echo "zde-2"
$poc_2 = 1
$rnd_od_kraje = Get-Random -Minimum 0 -Maximum 10

for ($cc = 0; $cc -le $d_text; $cc++){
[string] $znak = $text[$cc]
#echo $znak"<"
$radek = $maska.Substring(0,$rnd_od_kraje)
$radek += $maska.Substring(0,$poc_2)
$poc_2++
$radek += $znak

$rnd_do_konce = Get-Random -Minimum 0 -Maximum $d_maska # tady vzdy jina delka
$radek += $maska.Substring(0,$rnd_do_konce)
#$radek += "." # aby bylo videk konec radku
$pole_out += $radek
}
}


# zpusob 3
if ( $rnd_zpusob -eq 3 ){
#echo "zde-3"
$poc_3 = 1
#$rnd_od_kraje = 10
#$rnd_od_kraje = Get-Random -Minimum $d_text -Maximum (( $d_text + Get-Random -Minimum 1 -Maximum 10  ))
$rnd_od_kraje = Get-Random -Minimum $d_text -Maximum (( $d_text + 10 ))
for ($dd = 0; $dd -le $d_text; $dd++){
[string] $znak = $text[$dd]

$radek = $maska.Substring(0,$rnd_od_kraje)
$radek += $maska.Substring(0,$rnd_od_kraje-$poc_3+1)
$poc_3++
$radek += $znak
$rnd_do_konce = Get-Random -Minimum 0 -Maximum $d_maska # tady vzdy jina delka
$radek += $maska.Substring(0,$rnd_do_konce)
#$radek += "." # aby bylo videk konec radku
$pole_out += $radek
}
}


# zpusob 4
if ( $rnd_zpusob -eq 4 ){
#echo "zde-4"
$rnd_od_kraje = Get-Random -Minimum 5 -Maximum 10
#Get-Random -Minimum -1 -Maximum 2
for ($ee = 0; $ee -le $d_text; $ee++){
[string] $znak = $text[$ee]
$radek = $maska.Substring(0,$rnd_od_kraje)

# omezeni aby se po sobe opakovalo -1 a 1 nebo 1 a -1 ( misto toho bude nula )
#$old_rnd = 0
$rnd_2 = Get-Random -Minimum -1 -Maximum 2
if (( $old_rnd_2 -eq -1 ) -and ( $rnd_2 -eq 1 )) { 
#echo "zde"
$rnd_2 = 0
}

if (( $old_rnd_2 -eq 1 ) -and ( $rnd_2 -eq -1 )) { 
#echo "zde 2"
$rnd_2 = 0 
}

#echo $rnd_2

$old_rnd_2 = $rnd_2

#$radek += $maska.Substring(0,(( $rnd_od_kraje + $( Get-Random -Minimum -1 -Maximum 2) )) )  stary, puvodni
$radek += $maska.Substring( 0,$rnd_od_kraje + $rnd_2 )

$radek += $znak
$rnd_do_konce = Get-Random -Minimum 0 -Maximum $d_maska # tady vzdy jina delka
$radek += $maska.Substring(0,$rnd_do_konce)
#$radek += "." # aby bylo videk konec radku
$pole_out += $radek
}
}

} # for $opakuj

echo $pole_out

Set-Content -Path $file_output -Encoding Unicode -Value $pole_out
sleep 2

