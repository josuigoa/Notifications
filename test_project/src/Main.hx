package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

/**
 * ...
 * @author Josu Igoa
 */

class Main extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		var notifyBtn = new Btn("NOTIFY");
		notifyBtn.addEventListener(Btn.CLICK, onNotifyClick);
		notifyBtn.x = (stage.stageWidth - notifyBtn.width) * .5;
		notifyBtn.y = (stage.stageHeight - notifyBtn.height) * .5;
		addChild(notifyBtn);
	}
	
	private function onNotifyClick(e:Event):Void 
	{
		Notifications.createNotification("Ticker", "Titulua", "Testua", "emo_im_cool");
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
