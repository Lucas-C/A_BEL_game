package bel.graphics 
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Image;
	import bel.utils.dynamicGraphicLoader;

	/**
	 * My name is Lucas Cimon and I never write (useful) comments
	 */
	public class HUD extends Entity
	{
		private var m_pic:Entity;

		public function HUD() 
		{
			m_pic = new Entity();
			dynamicGraphicLoader("playeranim.png", setPic);
		}
		
		public function setPic(img:BitmapData):void
		{
			m_pic.graphic = new Image(img);
			m_pic.x = 50;
			m_pic.y = 50;
		}
		
		override public function update():void 
		{
			super.update();
		}
			
		override public function render():void 
		{
			//m_pic.render();
			super.render();
		}
	}

}