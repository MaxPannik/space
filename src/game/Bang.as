package game 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.utils.setTimeout;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import effects.Effects;
	import org.flintparticles.twoD.emitters.Emitter2D;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Bang extends MovieClip
	{
		private var image:Sprite = new Sprite();
		public var eff:Emitter2D = new Emitter2D();
		public var rocket:Boolean;
		private var score:String;
		
		public function Bang(x_:int, y_:int, rocket_:Boolean, score_:String = "") 
		{
			x = x_;
			y = y_;
			rocket = rocket_
			score = score_;
			
			image.addChild(Methods.loadImage("img/boom.png"));
			image.x = -40;
			image.y = -40;
			addChild(image);
			scaleX = 0.1;
			scaleY = scaleX;
			
			Scale();
			if(rocket){
				Effects.addBoom(this);
			}
		}
		
		public function Scale():void 
		{	
			var timer:Timer = new Timer(Settings.BornTime / 10, 10);
			timer.addEventListener(TimerEvent.TIMER, handlerTimer);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeTimer);
			timer.start();
			
			function handlerTimer() :void
			{
				if (rocket) {
					scaleX += 0.05;
				}else {
					scaleX += 0.1;
				}
				scaleY = scaleX;
			}
			
			function completeTimer() :void
			{
				var score_:TextField = new TextField();;
				score_.defaultTextFormat = new TextFormat("sans", 16, 0x000000, true, false, false, null, null, "center");
				score_.selectable = false;
				score_.text = score;
				score_.width = 80;
				score_.y += 27;
				image.addChild(score_);
				
				setTimeout(removeBang, Settings.LifeTime);
			}
			
		}
		
		public function removeBang() :void
		{
			Main.game.removeBang(this);
		}
		
	}

}