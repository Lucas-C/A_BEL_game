package bel.utils 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public function dynImgLoad(filename:String, ent:Entity):void
	{
		new DynGraphic(filename, ent,
			function assign(img:BitmapData, e:Entity):void { e.graphic = new Image(img); } );
	}
}