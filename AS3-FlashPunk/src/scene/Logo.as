package scene 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import flash.utils.getTimer;;

	public class Logo extends Entity 
	{
		[Embed(source = '../../assets/logo.png')] private const LOGO:Class;

		private const LOGO_LAYER:int = 1;
		private const SCROLL_MIDDLE_POS:int = 355;
		private const SCROLL_SHIFT:Number = 8;
		private const SCROLL_SPEED_FACTOR:Number = 300;

		public var m_image:Image = new Image(LOGO);
		
		public function Logo() 
		{
			this.layer = LOGO_LAYER;
			graphic = m_image;
			m_image.scale = 0.7111111;
			this.x = FP.screen.width / 2 - m_image.width * m_image.scale / 2;
			this.y = SCROLL_MIDDLE_POS;
		}
		
		var lastTime:Number = 0;
		override public function update():void 
		{
			var time:Number = getTimer();
			trace(time - lastTime);
			lastTime = time;
			this.y = SCROLL_MIDDLE_POS + SCROLL_SHIFT * Math.cos(getTimer() / SCROLL_SPEED_FACTOR);
			super.update();
		}
		
	}

}