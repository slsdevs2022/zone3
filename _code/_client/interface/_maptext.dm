mob/var/TxtSpd = 0.1
client/var/TxtSpd = 0.3


var/list/font_resources = list('blackjack.ttf') // To use A font you first need to specify the file somewhere. Let's do it now! :)
/HUD/Text
	parent_type = /obj
	screen_loc = "8,7"
	layer = 1000
	icon = 'box.dmi'

proc/screentext2(client/M,var/Text="")//client version of screen text, used as screentext2(client,"Message")
	var/Blank = " "
	for(var/HUD/Text/Te in M.screen)
		Te.maptext = ""
		del(Te)

	var/HUD/Text/T = new;M.screen.Add(T)

	T.maptext_width = length(Text) / length(Text)*400
	T.maptext_height = length(Text) / length(Text)*150
	while(length(Blank)-2<length(Text)+1)
		sleep(M.TxtSpd)
		Blank = addtext(Blank,"[getCharacter(Text,length(Blank))]")
		T.maptext = "<font face=\"Power Red and Blue\"><font size=2>[Blank]" // The name of the font is not its file's name.
		if(length(Blank)>=length(Text))
			break

proc/screentext(mob/M,var/Text="")//mob version of screen text, used as screentext(mob(src),"Message")
	var/Blank = " "
	for(var/HUD/Text/Te in M.client.screen)
		Te.maptext = ""
		del(Te)

	var/HUD/Text/T = new;M.client.screen.Add(T)

	T.maptext_width = length(Text) / length(Text)*400
	T.maptext_height = length(Text) / length(Text)*150
	while(length(Blank)-2<length(Text)+1)
		sleep(M.TxtSpd)
		Blank = addtext(Blank,"[getCharacter(Text,length(Blank))]")
		T.maptext = "<font face=\"Power Red and Blue\"><font size=2>[Blank]" // The name of the font is not its file's name.
		if(length(Blank)>=length(Text))
			break


proc
	getCharacter(string, pos=1)
		return ascii2text(text2ascii(string, pos)) //This proc is used to retrieve the next character in text string.




/* EXAMPLE
mob/Login()
	..()
	screentext(src,"This is some text. Do you see it? Of course you do! Motherfucker!!!")


mob/verb/Spd_up()
	set hidden = 1
	if(src.TxtSpd == 1) {src.TxtSpd = 0.1 ; return} //If our speed is normal, Speed up!
	if(src.TxtSpd == 0.1) {src.TxtSpd = 1 ; return} //If speed is fast, Slow down.

*/