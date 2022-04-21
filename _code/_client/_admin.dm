#define ADMIN_FILE "/config/admins.txt"

proc
	create_admins_txt()
		if(fexists(ADMIN_FILE)) return //if this file exists
		..()

world
	New()
		..()
		if(!fexists(ADMIN_FILE)) create_admins_txt()

client
	proc
		isadmin()
			var/admins = file2text(ADMIN_FILE)
			if(findtext(src.ckey,admins)) return TRUE //means say yes
			else return FALSE
		fix_admin()

			..()
	New()
		if(src.isadmin()) src.fix_admin()
		else ..()