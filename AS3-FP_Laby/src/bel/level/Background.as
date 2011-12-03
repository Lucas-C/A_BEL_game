package bel.level 
{
	import bel.utils.assert;
	import bel.utils.DynImage;
	import net.flashpunk.Entity;
		
	/**
	 * Image behind the level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Background extends Entity 
	{
		private const BACKGROUND_LAYER:int = 10;
		private var m_dynImage:DynImage;
		
		public function Background() 
		{
			m_dynImage = new DynImage("assets/background.png", this);
			this.layer = BACKGROUND_LAYER;
		}
	}

}