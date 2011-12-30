package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import bel.utils.DynGraphic;
		
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
				new DynGraphic("assets/background.png", this,
					function assign(img:BitmapData, e:Entity):void {
						if (Background.sharedGraphic == null)
							e.graphic = Background.sharedGraphic = new Image(img);
						else
							e.graphic = Background.sharedGraphic;
					}
				);
			else
				this.graphic = sharedGraphic;
			this.layer = 10;
		}
	}

}