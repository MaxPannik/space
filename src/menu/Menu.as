package menu 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Menu extends MovieClip 
	{
		
		public function Menu(start:Boolean) 
		{
			addChild(Methods.loadImage("img/space.jpg"));
			
			if (!start) {
				var score_:TextField = new TextField();;
				score_.defaultTextFormat = new TextFormat("sans", 28, 0xFFFFFF, true, false, false, null, null, "center");
				score_.width = 500;
				score_.selectable = false;
				score_.text = "Score: " + Main.score;
				score_.x = 150;
				score_.y = 200;
				addChild(score_);
			}
			
			var btnStart:MovieClip = new Button("Играть", startGame);
			btnStart.x = 325;
			btnStart.y = 250;
			addChild(btnStart);
		}
		
		public function startGame(event:MouseEvent):void 
		{
			Main.startGame();
		}
		
	}

}