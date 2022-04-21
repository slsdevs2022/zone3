
mob
	Login()
		..()
		//screentext2(src.client,"[src.key] has logged in...")
		screentext2(src.client,MOTD)
	Logout()
		..()
		//world<<"<i><b>[src.key] has logged out!</b></i>"



client
	var
		fullscreen = TRUE
	New()
		detectfullscreen()
		world<<"<b>[src] has logged in!</b>"
		src.align_text()
		winset(src,"default","focus=true")
		//screentext2(src,"[src.key] has logged in...")
		..()

	Del()
		world<<"<b>[src] has logged out!</b>"
		..()
	verb
		ToggleFullscreen()
			set hidden = 1
			fullscreen = !fullscreen //will toggle from true/false and so on...
			if(fullscreen) src.gofullscreen();else src.screenrevert()
		CheckFullscreen()
			set hidden = 1
			src << "<small><b>Your fullscreen variable is [fullscreen]</b></small>"
			src.align_text()
			winset(src,"default","focus=true")
	proc
		detectfullscreen()
			set hidden = 1
			if(fullscreen) src.gofullscreen();else src.screenrevert()
		gofullscreen()
			winset(src, "default", "is-maximized=false;can-resize=false;titlebar=false;menu=") //Reset to not maximized and turn off titlebar.
			winset(src, "default", "is-maximized=true") //Now set to maximized. We have to do this separately, so that the taskbar is appropriately covered.
		screenrevert()
			winset(src, "default", "is-maximized=false;can-resize=true;titlebar=true;menu=menu") //Set window to normal size.
		align_text()
			set hidden = 1
			var/a=winget(src,"default","pos")
			var/chatx=text2num(copytext(a,1,","))
			var/chaty=text2num(copytext(a,findtext(a,",")+1))
			if(!fullscreen) winset(src,"chat","pos=[chatx+5],[chaty+360]");else winset(src,"chat","pos=[chatx+-600],[chaty+-15]") //-600x-15 best for fullscreen rn...
			spawn(1) src.align_text()


client/verb
	ooc(t as text)
		set hidden = 1
		if(t) world<<"<b>\[OOC] [src.key]: [html_encode(t)]</b>"

/*
mob
	Login()
		world<<"<b>[src.name] has logged in!</b>"
		src.client.align_text()
		winset(src,"default","focus=true")
		..()
	Logout()
		..()
		world<<"<i><b>[src.name] has logged out!</b></i>"
		del(src)

mob/proc/align()
	var/a=winget(src,"default","pos")
	var/chatx=text2num(copytext(a,1,","))
	var/chaty=text2num(copytext(a,findtext(a,",")+1))
	if(!usr.client.fullscreen) winset(src,"chat","pos=[chatx+5],[chaty+360]");else winset(src,"chat","pos=[chatx+25],[chaty+360]")
	spawn(1) src.align()

*/