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
		public function Background() 
		{
			dynImgLoad("assets/background.png", this);
			this.layer = 10;
		}
	}

}