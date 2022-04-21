client
	verb
		ToggleFullscreen()
			set hidden = 1
			fullscreen = !fullscreen //will toggle from true/false and so on...
			if(fullscreen) src.GoFullscreen();else src.ScreenRevert()
		CheckFullscreen()
			set hidden = 1
			src << "Your fullscreen variable is [fullscreen]"
			src.align_text()
			winset(src,"default","focus=true")
	proc
		GoFullscreen()
			winset(src, "default", "is-maximized=false;can-resize=false;titlebar=false;menu=") //Reset to not maximized and turn off titlebar.
			winset(src, "default", "is-maximized=true") //Now set to maximized. We have to do this separately, so that the taskbar is appropriately covered.
		ScreenRevert()
			winset(src, "default", "is-maximized=false;can-resize=true;titlebar=true;menu=menu") //Set window to normal size.

/*mob/proc/align()
	var/a=winget(src,"default","pos")
	var/chatx=text2num(copytext(a,1,","))
	var/chaty=text2num(copytext(a,findtext(a,",")+1))
	if(!usr.client.fullscreen) winset(src,"chat","pos=[chatx+5],[chaty+360]");else winset(src,"chat","pos=[chatx+25],[chaty+360]")
	spawn(1) src.align()*/

client/verb
	align_text()
		var/a=winget(src,"default","pos")
		var/chatx=text2num(copytext(a,1,","))
		var/chaty=text2num(copytext(a,findtext(a,",")+1))
		if(!fullscreen) winset(src,"chat","pos=[chatx+5],[chaty+360]");else winset(src,"chat","pos=[chatx+-600],[chaty+-15]") //-600x-15 best for fullscreen rn...
		spawn(1) src.align_text()
	say(t as text|null)
		if(t)
			world<<"<b>[src.mob.name]: [html_encode(t)]</b>"


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
//