package bel.level 
{
	import net.flashpunk.Entity;
	import bel.utils.dynImgLoad;
		
	/**
	 * Image behind the level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Background extends Entity 
	{
		private const BACKGROUND_LAYER:int = 10;
		
		public function Background() 
		{
			dynImgLoad("assets/background.png", this);
			this.layer = BACKGROUND_LAYER;
		}
	}

}