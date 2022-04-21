client/verb
	ServerInfo()
		set hidden = 1
		var/calcLag = abs(world.cpu - 100)
		var/server
		server+= {"<b>\[SERVER INFO]</b><br>"}
		server+= {"<small>Server Hosted On: [world.system_type]<br>"}
		server+= {"<small>Server Efficiency: [calcLag]%<br>"}
		server+= {"<small>Server Address: byond://[world.address]:[world.port]<br>"}
		server+= {"<small>Time Hosted: [world.time/100](Seconds)<br>"}
		src<<server
		align_text()
		winset(src,"default","focus=true")

	Who()
		set hidden = 1
		var/tmp/PeopleOn = 0
		for(var/mob/M in world)
			if(M.client)
				PeopleOn += 1
				src << "<font color=red>Name:[M.name] <font color=blue>BYOND Key:[M.key]"
			/*if(M.GM)//if someone in your game is gm set the gm var so they can be shown up on who
				usr << "-><font size=1>Name:[M.name] BYOND Key [M.key] is a GM"*/
		src << "Player(s) Online:[PeopleOn]"
		align_text()
	Who2()
		set hidden = 1
		var/tmp/PeopleOn = 0
		for(var/mob/M in world)
			if(M.client)
				PeopleOn += 1
				screentext(src.mob,"<font color=red>Name:[M.name] <font color=blue>BYOND Key:[M.key]")
			/*if(M.GM)//if someone in your game is gm set the gm var so they can be shown up on who
				usr << "-><font size=1>Name:[M.name] BYOND Key [M.key] is a GM"*/
		src << "Player(s) Online:[PeopleOn]"
		align_text()

	//screentext(src,"This is some text. Do you see it? Of course you do! Motherfucker!!!")