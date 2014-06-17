#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace notifications;


static void cameramic_takephoto (value ticker, value title, value text, value iconname)
{
    CreateNotification(val_get_string(ticker), val_get_string(title), val_get_string(text), val_get_string(iconname));
}
DEFINE_PRIM (notification_createnotification, 1);



extern "C" void notifications_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (notifications_main);



extern "C" int notifications_register_prims () { return 0; }