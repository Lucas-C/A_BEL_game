package scene 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Background extends Entity 
	{
		[Embed(source = '../../assets/background.png')] private const BACKGROUND:Class;
		private const BACKGROUND_LAYER:int = 10;
		public var m_image:Image = new Image(BACKGROUND);
		
		public function Background() 
		{
			this.layer = BACKGROUND_LAYER;
			m_image.scale = 0.7111111;
			graphic = m_image;
		}
	}

}