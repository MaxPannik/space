package 
{
	import flash.events.*;
	import flash.net.*;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Settings 
	{
		
		public static var CountPoints:int = 0;
		public static var BornTime:int = 0;
		public static var LifeTime:int = 0;
		
		public static function Config(): void
		{
			var loader:URLLoader = new URLLoader(); 
			loader.addEventListener(IOErrorEvent.IO_ERROR, handlerError); 
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handlerError); 
			loader.addEventListener(Event.COMPLETE, handlerComplete); 
			
			loader.load(new URLRequest("input.txt"));
			
			function handlerComplete(event:Event ):void 
			{ 
				var conf:String = URLLoader(event.target).data; 
				var pattern:RegExp = /\n/g; 
				conf = conf.replace(pattern, "&")
				var urlVariables:URLVariables = new URLVariables(conf);
				
				CountPoints = urlVariables.CountPoints; 
				BornTime = int(urlVariables.BornTime) * 1000;
				LifeTime = int(urlVariables.LifeTime) * 1000;
			}
			
			function handlerError(event:Event ):void 
			{ 
				trace("error");
			}
		}
	}
	
}