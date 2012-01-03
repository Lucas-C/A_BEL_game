package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import bel.utils.dynamicGraphicLoader;
		
	/**
	 * Image behind the level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Background extends Entity 
	{
		static private var sharedGraphic:Image; // Bricolage pour ne pas charger de multiples images -> inutile car singleton ici
		
		public function Background() 
		{
			if (sharedGraphic == null)
				dynamicGraphicLoader("background.png", setSharedGraphic);
			else
				this.graphic = sharedGraphic;
			this.layer = 10;
		}

		public function setSharedGraphic(img:BitmapData):void
		{
			if (sharedGraphic == null)
				this.graphic = sharedGraphic = new Image(img);
			else
				this.graphic = sharedGraphic;			
		}
	}

}