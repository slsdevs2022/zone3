/*
THIS MUST BE ON, THIS IS THE PREPROCESSOR FILE FOR COMPILING IN DM
ONLY TURN OFF IF YOU KNOW WHAT YOU'RE DOING
*/

#ifdef USE_LIGHTING //ifdef is used for warnings, which will allow it to compile but warn
#warn The lighting feature in MyLibrary is experimental.
#endif

#if DM_VERSION < 4 //This is so if DM is way out of date it'll refuse to compile
#error DreamMaker out of date, please update.
#endif


#if DM_VERSION < 5.12 //This is so if DM is kind of out of date it'll warn but compile
#warn WARNING: This version of DreamMaker is outdated... Errors may occur
#endif


#if DM_VERSION > 514.1500 //This is so if DM hasn't been tested it'll warn them
#warn WARNING: This version of DreamMaker has not been tested with this branch, errors may occur
#endif


#if defined(DEBUG) //If DEBUG mode in Build>Preferences for zone6> is checked it'll warn the compiler
#warn DEBUG MODE ON
#else
//#warn DEBUG MODE OFF
#endif
