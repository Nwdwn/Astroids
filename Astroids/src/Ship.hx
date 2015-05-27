package ;
import js.html.Point;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Andor
 */
class Ship extends gameobject
{
	
		
	public var throttle : Float = 0.0 ;
	public var steer : Float = 0.0 ;
	public var fire : Bool = false ;
	
	
	
	public function new() 
	{
		super( img/sputnik.png );
		

	}
	
	
	public override function update ( elapsedTime:Float )
	
	{
		var angleRandians:Float = Math.PI * ( rotation / 180 );
		acceleration.x = 100 * throttle * Math.cos( angleRandians );
		acceleration.y = 100 * throttle * Math.cos( angleRandians );
		
		 super.update( elapsedTime ):
	}
	
}