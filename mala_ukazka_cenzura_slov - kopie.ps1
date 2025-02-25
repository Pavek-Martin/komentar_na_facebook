cls
# toto by napr. mohla byt databaze facebooku ve ktere bude mit seznam, tzv. nezadoucich slov
# ktere je potreba stojove osetrit a nepustit je do dale svete
$pole_seznam_nazadoucich_slov = @( "hovado", "blbe", "debile", "krava", "hovno" )
#                                  index[0]    [1]      [2]       [3]      [4]

for ($slovo = 0; $slovo -le $pole_seznam_nazadoucich_slov.Length -1 ; $slovo++ ) {
# delka pole je 5 polozek ale zacina se do nuli tzn. length -1
$jedno_slovo = $pole_seznam_nazadoucich_slov[$slovo]
# promenna "$jedno_slovo" bude ve for cyklu postupne nabyvat vsech polozek pole "$pole_seznam_nazadoucich_slov"
# tzn. pri prvnim pruchodu cyklem kdyz bude hodnota promenny "$slovo" rovna nule, coz je nadefinovany
# na zacatku for cyklu, priradi promenny "$jedno_slovo" index pole [0]
# $slovo++ na konci radku z for cyklem znamena ze se promena "slovo" zvysuje vzdy o +1 (tzv. inkrementace )
# takze v dalsim pruchodu bude index [1] atd. a postupne projde cely az do posledniho slova coz je "hovno"


# zde kontrola jestli promenna $text neobsahuje nejake slovo ze seznamu
#$text = "toto bude bude muj komentar"
$text = "bylo tam obrovsky hovno"

$verdikt = $text.IndexOf($jedno_slovo)
if ( $verdikt -ne -1 ) { echo "nevhodny komentar"; break } 
# tady je na konci radku break tzn. pri prvnim nalezu slova se for cyklus ukonci a nejede zbytecne az do konce
# samozdrejme muze pokracovat a hledat jesli $text neobsahuje vice slov z seznamu
# toto je pouze ukazka a zaklad toho jak to asi muze fungovat a urcite to budou mit mnohem propracovanejsi
} # zakonceni cyklu for $slovo
sleep 10