package game 
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.geom.Point;
	
	import effects.Effects;
	import org.flintparticles.twoD.emitters.Emitter2D;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Rocket extends MovieClip
	{
		private var image:Sprite = new Sprite();
		public var fire:Emitter2D = new Emitter2D();
		private var speed:int = 5;
		public var speedX:Number;
		public var speedY:Number;
		public var angle:Number;
		
		public function Rocket() 
		{
			image.addChild(Methods.loadImage("img/rocket.png"));
			image.x = -20;
			image.y = -10;
			this.addChild(image);
			
			this.x = Math.random() * (Main.width_ - 50);
			this.y = Math.random() * (Main.height_ - 50);
			fire.x = this.x;
			fire.y = this.y;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			angle = Math.random() * 360;
			this.rotation = angle;
			speedX = speed * Math.cos(angle * Math.PI / 180);
			speedY = speed * Math.sin(angle * Math.PI / 180);
		}
		
		private function onEnterFrame(e:Event):void {
			for each(var bang:Bang in Main.game.bangList){
				if (Methods.checkForCollision(this, bang, 120)) {
					var score:int;
					if (bang.rocket) {
						score = 500;
					}else {
						score = 100;
					}
					Main.score += score;
					Main.game.updateScore();
					
					Main.game.removeRocket(this, score);
					fire.stop();
				}
			}
			
			speedX = speed * Math.cos(angle * Math.PI / 180);
			speedY = speed * Math.sin(angle * Math.PI / 180);
			this.x += speedX;
			this.y += speedY;
			fire.x = this.x;
			fire.y = this.y;
				
			//проверяем достижение края экрана
			if (this.x >= Main.width_ - this.width/2 || this.x <= 0 + this.width/2) {
				var Xspeed:Number = speed * Math.cos(angle * Math.PI / 180);
				var Yspeed:Number = speed * Math.sin(angle * Math.PI / 180);
				var vxip:Number = Xspeed * Math.cos(0 * Math.PI / 180) - Yspeed * Math.sin(0 * Math.PI / 180);
				var vyip:Number = Yspeed * Math.cos(0 * Math.PI / 180) + Xspeed * Math.sin(0 * Math.PI / 180);
				var vxfp:Number = -vxip;
				var vyfp:Number = vyip;
				var vxf:Number = vxfp * Math.cos(0 * Math.PI / 180) - vyfp * Math.sin(0 * Math.PI / 180);
				var vyf:Number = vyfp * Math.cos(0 * Math.PI / 180) + vxfp * Math.sin(0 * Math.PI / 180);
					
				angle = Math.atan2(vyf, vxf) * 180 / Math.PI;
					
				this.rotation = angle;
				if(this.x >= Main.width_ - this.width/2){
					this.x = Main.width_ - this.width / 2;
				}else if(this.x <= 0 + this.width/2){
					this.x = 0 + this.width/2;
				}
			}else if (this.y >= Main.height_ - this.height/2 || this.y <= 0 + this.height/2){
				var Xspeed_:Number = speed * Math.cos(angle * Math.PI / 180);
				var Yspeed_:Number = speed * Math.sin(angle * Math.PI / 180);
				var vxip_:Number = Xspeed_ * Math.cos(0 * Math.PI / 180) - Yspeed_ * Math.sin(0 * Math.PI / 180);
				var vyip_:Number = Yspeed_ * Math.cos(0 * Math.PI / 180) + Xspeed_ * Math.sin(0 * Math.PI / 180);
				var vxfp_:Number = vxip_;
				var vyfp_:Number = -vyip_;
				var vxf_:Number = vxfp_ * Math.cos(0 * Math.PI / 180) - vyfp_ * Math.sin(0 * Math.PI / 180);
				var vyf_:Number = vyfp_ * Math.cos(0 * Math.PI / 180) + vxfp_ * Math.sin(0 * Math.PI / 180);
					
				angle = Math.atan2(vyf_, vxf_) * 180 / Math.PI;
					
				this.rotation = angle;
				if(this.y >= Main.height_ - this.height/2){
					this.y = Main.height_ - this.height / 2;
				}else if(this.y <= 0 + this.height/2){
					this.y = 0 + this.height / 2;
				}
			}
		}
			
	}
	
}