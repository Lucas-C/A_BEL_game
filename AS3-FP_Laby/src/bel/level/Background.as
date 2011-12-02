package bel.level 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	/**
	 * Image behind the level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Background extends Entity 
	{
		[Embed(source = '../../../assets/background.png')] private const BACKGROUND:Class;
		private const BACKGROUND_LAYER:int = 10;
		public var m_image:Image = new Image(BACKGROUND);
		
		public function Background() 
		{
			this.layer = BACKGROUND_LAYER;
			graphic = m_image;
		}
	}

}