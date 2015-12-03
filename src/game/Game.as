package game 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	import effects.Effects;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Game extends MovieClip
	{
		public var bangPlayer:Bang;
		public var bangList:Array = new Array();
		public var rocketList:Array = new Array();
		public var score_:TextField = new TextField();;
		
		public function Game() 
		{
			Main.score = 0;
			
			addChild(Methods.loadImage("img/space.jpg"));
			addChild(Effects.createBitmapRenderer());
			
			score_.defaultTextFormat = new TextFormat("sans", 20, 0xCCCCCC, true);
			score_.width = 300;
			score_.selectable = false;
			addChild(score_);
			updateScore();
			
			for (var j:int = 0; j < Settings.CountPoints; j++){
				var rocket:Rocket = new Rocket();
				addChild(rocket);
				rocketList.push(rocket);
				Effects.addFire(rocket);
			}
			
			addEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		public function MouseClickHandler(event:MouseEvent):void 
		{
			if(bangPlayer == null){
				bangPlayer = new Bang(event.stageX, event.stageY, false);
				bangList.push(bangPlayer);
				addChild(bangPlayer);
			}
		}
		
		public function removeBang(bang:Bang):void 
		{
			removeChild(bang);
			bangList.splice(bangList.indexOf(bang), 1);
			if(bang == bangPlayer){
				bangPlayer = null;
			}
			
			if (bangList.length == 0 && rocketList.length == 0) {
				setTimeout(endGame, 1000);
			}
		}
		
		public function removeRocket(rocket:Rocket, scoreR:int):void 
		{
			var bang:Bang = new Bang(rocket.x, rocket.y, true, "+"+scoreR);
			bangList.push(bang);
			addChild(bang);
			removeChild(rocket);
			rocketList.splice(bangList.indexOf(rocket), 1);
		}
		
		public function updateScore():void 
		{
			score_.text = "Score: " + Main.score;
		}
		
		public function endGame():void 
		{
			Main.openMenu(false);
		}
		
	}

}