package bel.graphics 
{
	import net.flashpunk.Entity;
	import bel.utils.dynImgLoad;

	/**
	 * My name is Lucas Cimon and I never write (useful) comments
	 */
	public class HUD extends Entity
	{
		private var m_pic:Entity;

		public function HUD() 
		{
			m_pic = new Entity();
			dynImgLoad("assets/playeranim.png", m_pic);
			m_pic.x = 50;
			m_pic.y = 50;

		}
		
		override public function update():void 
		{
			super.update();
		}
			
		override public function render():void 
		{
			super.render();
			m_pic.render();
		}
	
	}

}