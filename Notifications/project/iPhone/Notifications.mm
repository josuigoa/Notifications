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

@end

namespace Notifications
{
	Notifications *_Notifications;

	void CreateNotification(const char* ticker, const char* title, const char* text, const char* iconname)
	{
		//return [Notifications setAppFilesDirectory:[NSString stringWithUTF8String:subdir]];
	}
}