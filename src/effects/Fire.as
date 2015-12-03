package effects 
{
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.Dot;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.twoD.actions.*;
	import org.flintparticles.twoD.emitters.Emitter2D;
	
	import game.Rocket;
	
	/**
	 * ...
	 * @author Max
	 */
	public class Fire extends Emitter2D
	{
		
		public function Fire() 
		{
			counter = new Steady( 50 );
      
			addInitializer( new SharedImage( new Dot( 2 ) ) );
			addInitializer( new ColorInit( 0xFFFF9900, 0xFFFF5500 ) );
			addInitializer( new Lifetime( 0.1 ) );

			addAction( new Age() );
			addAction( new Move() );
		}
		
	}

}