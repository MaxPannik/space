package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import game.Game;
	import menu.Menu;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Main extends Sprite
	{
		
		public static var width_:int = 800;
		public static var height_:int = 600;
		
		public static var MainPanel:MovieClip = new MovieClip();
		public static var menu:Menu;
		public static var game:Game;
		
		public static var score:int;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Settings.Config();
			
			addChild(MainPanel);
			
			openMenu(true);
		}
		
		public static function openMenu(start:Boolean):void 
		{
			if (!start) {
				MainPanel.removeChild(game);
			}
			
			menu = new Menu(start);
			MainPanel.addChild(menu);
		}
		
		public static function startGame():void 
		{
			MainPanel.removeChild(menu);
			
			game = new Game();
			MainPanel.addChild(game);
		}
		
	}
	
}