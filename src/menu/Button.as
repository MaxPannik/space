package menu 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Button extends MovieClip 
	{
		private var spr:Sprite = new Sprite();
		private var spr_h:Sprite = new Sprite();
		
		public function Button(text:String, MouseClickHandler:Function) 
		{
			spr.addChild(Methods.loadImage("img/button.png"));
			
			spr_h.addChild(Methods.loadImage("img/button_hover.png"));
			spr_h.visible = false;
			
			addChild(spr);
			addChild(spr_h);
			
			addEventListener(MouseEvent.MOUSE_OVER, MouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, MouseOutHandler);
			addEventListener(MouseEvent.CLICK, MouseClickHandler);
			
			var lable:TextField;
			lable = new TextField();
			lable.defaultTextFormat = new TextFormat("sans", 16, 0x000000, true, false, false, null, null, "center");
			lable.selectable = false;
			lable.text = text;
			lable.x = 25;
			lable.y = 10;
			addChild(lable);

			function MouseOverHandler(event:MouseEvent):void{
				spr.visible = false;
				spr_h.visible = true;
			}

			function MouseOutHandler(event:MouseEvent):void{
				spr.visible = true;
				spr_h.visible = false;
			}
		}
	}

}