package src;

import openfl.display.Sprite;


/**
 * ...
 * @author Ruben
 */
class gameobject extends sprite
{
	
	var velocity:Point = new( 0, 0 );
	var acceleration:Point = new( 0, 0 );
	
	public function update( elapsedTime:Float )
	
	{
		// aply accelarion to position
		
		velocity.x = velocity.x * + elapsedTime * acceleration.x;
		velocity.y = velocity.y * + elapsedTime * acceleration.y;
		
		// apply velocity to position
		
		x = x + elapsedTime * velocity.x;
		y = y + elapsedTime * velocity.y;
		
		// reset acceleration (remove?)
		
		acceleration.x = 0;
		acceleration.y = 0;
		
		
	}

	public function new( bitmapName:String ) 
	{
		super();
		
		
		var bitmapData = Assets.getBitmapData ( bitmapName );
		var bitmap = new Bitmap(bitmapData);
		
		bitmap.scaleX = 0.5 ;
		bitmap.scaleY = 0.5 ;
		bitmap.x = bitmap.x - (7*(bitmap.width / 8)) ;
		bitmap.y = bitmap.y - (bitmap.height / 2) ;
	
		
		
		addChild (bitmap);
		
	}
	
}