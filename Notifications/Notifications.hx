package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class Notifications
{
	// Sadly we cannot use JNI here, we have to wait for the main() function to be executed.
	// I tried but it failed :)
	private static var notifications_createnotification : Dynamic;

	private static function init()
	{
	    if (notifications_createnotification != null)
	        return;
		
		#if android
	    notifications_createnotification = JNI.createStaticMethod(
	        "org.haxe.extension.Notifications",
	        "createNotification",
	        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V"
	    );
		#else
		notifications_createnotification = Lib.load ("notifications", "notification_createnotification", 4);
		#end
	}

	public static function createNotification(tickerText:String, contentTitle:String, contentText:String, iconName:String = "")
	{
	    init();
	    notifications_createnotification(tickerText, contentTitle, contentText, iconName);
	}
}