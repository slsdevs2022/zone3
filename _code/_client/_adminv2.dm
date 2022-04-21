var/list/admins_list = new/list
var/admin_file = "/config/admins.txt" //file admins is
var/split_symbol = ";" //symbol list splits by
var/StartList = "|ADMIN" // |ADMIN begins where admins are listed
var/EndList = "ADMIN|" // ADMIN| is where admins end
var/admins_loaded = FALSE // TRUE|FALSE
var/list/admins = list("itsjusallah","davidmwindow")//List of keys you want to be manually overriden as admin by ckey

//When the world starts it will pause for one second then retrieve the list.
world/New()
	world.LoadAdmins()
	..()


/*
What this will do is first pull the content of from the link given.
Afterwards it will set up your basic diamitors(It basicly locates your list)
Followed by it removing all returns(what happens when you press enter) and finally, it searches
for the character ; to indicate seperation between names.
*/


world/proc/CreateAdmins()
	..()


world/proc/LoadAdmins()
	var/f = admin_file
	if(admin_file)
		f = html_decode(file2text(f["CONTENT"]))
		var/St = findtext(f,StartList)
		if(!St)
			world << "Start-Error in list format!"
			return
		var/Ed = findtext(f,EndList)
		if(!Ed)
			world << "End-Error in list format!"
			return
		f = copytext(f,St+length(StartList),Ed)
		if(f)
			while(findtext(f,"\n"))
				var/n = findtext(f,"\n")
				if(n)
					var/bn = copytext(f,1,n)
					var/an = copytext(f,n+1,length(f)+1)
					f = bn + an
			while(findtext(f,"<br>"))
				var/n = findtext(f,"<br>")
				if(n)
					var/bn = copytext(f,1,n)
					var/an = copytext(f,n+length("<br>"),length(f)+1)
					f = bn + an
			while(findtext(f,"[split_symbol]"))
				var/n = findtext(f,"[split_symbol]")
				admins_list += "[copytext(f,1,n)]"
				f = copytext(f,n+1,length(f)+1)
			if(length(f) > 0)
				admins_list += f
	admins_loaded = TRUE
	world.log << "ADMINS LOADED"


