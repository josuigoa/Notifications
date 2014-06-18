#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface Notifications:NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
	NSString* _audioPath;
	AVAudioRecorder* _audioRecorder;
	AVAudioPlayer* _audioPlayer;
}
@end

@implementation Notifications

static NSString* _appFilesDirectory;
+(const char*)setAppFilesDirectory:(NSString*)subdir
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	_appFilesDirectory = [[paths objectAtIndex:0] stringByAppendingString:subdir];
    const char *ptr = [_appFilesDirectory cStringUsingEncoding:NSUTF8StringEncoding];
    return ptr;
}

+(const char*)getAppDirectory
{
	if(_appFilesDirectory == nil)
		[Notifications setAppFilesDirectory:@""];
	
    const char *ptr = [_appFilesDirectory cStringUsingEncoding:NSUTF8StringEncoding];
    return ptr;
}

+(void)createNotification:(NSString*) body
							action:(NSString*) alertAction
							sound:(NSString*) soundfileName
							launchImage:(NSString*) launchImage
{
							//andInfo:(NSDictionary*) userInfo
	//UILocalNotification* localNotification = [[UILocalNotificationalloc] init];
	//localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:60];
	//localNotification.alertBody = @"Your alert message";
	//localNotification.timeZone = [NSTimeZone defaultTimeZone];
	//[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	
	
	
	UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:60];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];	
 
    localNotification.alertBody = body;
    localNotification.alertAction = alertAction;	
 
	if(soundfileName == nil)
	{
		localNotification.soundName = UILocalNotificationDefaultSoundName;
	}
	else
	{
		localNotification.soundName = soundfileName;
	}
 
	localNotification.alertLaunchImage = launchImage;
	localNotification.repeatInterval = 0;
 
	//self.badgeCount ++;
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.userInfo = userInfo;
 
	// Schedule it with the app
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [localNotification release];
}

@end

namespace Notifications
{
	Notifications *_Notifications;

	void CreateNotification(const char* ticker, const char* title, const char* body, const char* iconname)
	{
		return [Notifications createNotification:[NSString stringWithUTF8String:ticker] [NSString stringWithUTF8String:title] [NSString stringWithUTF8String:body] [NSString stringWithUTF8String:iconname]];
	}
}