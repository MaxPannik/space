package effects 
{
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	
	import flash.display.MovieClip;
	import flash.filters.BlurFilter;
	import flash.geom.Rectangle;
	
	import game.Bang;
	import game.Rocket;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Effects 
	{
		public static var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 800, 600 ) );
		
		public static function createBitmapRenderer() : BitmapRenderer
		{
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );//след
			return renderer;
		}
		
		public static function addFire(rocket:Rocket) : void
		{
			var emitter:Emitter2D;
			emitter = new Fire();
			renderer.addEmitter( emitter );
			rocket.fire = emitter;

			emitter.start( );
		}
		
		public static function addBoom(bang:Bang) : void
		{
			var emitter:Emitter2D;
			emitter = new Boom();
			emitter.x = bang.x;
			emitter.y = bang.y;
			renderer.addEmitter( emitter );
			bang.eff = emitter;

			emitter.start( );
		}
		
	}

}