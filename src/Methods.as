package 
{
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Methods 
	{
		public static function generateRndColor(): uint
		{
			var color:uint = Math.random() * 0x1000000;
			return color;
		}
		
		public static function loadImage(request:String): Loader
		{
			var pictLdr:Loader = new Loader(); 
			var pictURLReq:URLRequest = new URLRequest(request); 
			pictLdr.load(pictURLReq);
			return pictLdr;
		}
		
		public static function checkForCollision(p_clip1:MovieClip, p_clip2:MovieClip, p_alphaTolerance:Number = 255):Rectangle {
			if (p_clip1 == null || p_clip2 == null) {
				return null;
			}
			
			// get bounds:
			var bounds1:Object = p_clip1.getBounds(p_clip1.parent);
			var bounds2:Object = p_clip2.getBounds(p_clip2.parent);
			
			// rule out anything that we know can't collide:
			if (((bounds1.right < bounds2.left) || (bounds2.right < bounds1.left)) || ((bounds1.bottom < bounds2.top) || (bounds2.bottom < bounds1.top)) ) {
				return null;
			}
			
			// determine test area boundaries:
			var bounds:Object = {};
			bounds.left = Math.max(bounds1.left,bounds2.left);
			bounds.right = Math.min(bounds1.right,bounds2.right);
			bounds.top = Math.max(bounds1.top,bounds2.top);
			bounds.bottom = Math.min(bounds1.bottom,bounds2.bottom);
			
			// set up the image to use:
			var width_bm:Number = bounds.right - bounds.left;
			var height_bm:Number = bounds.bottom - bounds.top;
			if (width_bm < 1) {
				width_bm = 1;
			}
			if (height_bm < 1) {
				height_bm = 1;
			}
			var img:BitmapData = new BitmapData(width_bm, height_bm, false);
			
			// draw in the first image:
			var mat:Matrix = p_clip1.transform.concatenatedMatrix;
			mat.tx -= bounds.left;
			mat.ty -= bounds.top;
			img.draw(p_clip1,mat, new ColorTransform(1,1,1,1,255,-255,-255,p_alphaTolerance));
			
			// overlay the second image:
			mat = p_clip2.transform.concatenatedMatrix;
			mat.tx -= bounds.left;
			mat.ty -= bounds.top;
			img.draw(p_clip2,mat, new ColorTransform(1,1,1,1,255,255,255,p_alphaTolerance),"difference");
			
			// find the intersection:
			var intersection:Rectangle = img.getColorBoundsRect(0xFFFFFFFF,0xFF00FFFF);
			
			// if there is no intersection, return null:
			if (intersection.width == 0) { return null; }
			
			// adjust the intersection to account for the bounds:
			intersection.x += bounds.top;
			intersection.y += bounds.left;
			
			return intersection;
		}
	}
	
}