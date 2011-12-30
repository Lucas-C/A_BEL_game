package bel.level 
{
	import net.flashpunk.FP;
	
	/**
	 * My name is Lucas Cimon and I never write (useful) comments
	 */
	public class ScrollingCamera 
	{
		private var m_x:int; // private because when they are modified, 
		private var m_y:int; // FP.camera also has to be modified
		public var m_speed:int;
		
		public function ScrollingCamera() 
		{
			m_x = 0;
			m_y = 0;
		}
		
		public function update():void 
		{
			
		}
		
		public function setX(x: int): void 
		{
			m_x = x;
			FP.camera.x;
		}
		
		public function setY(y: int): void 
		{
			m_y = y;
			FP.camera.y;
		}
		
		public function getX(): int
		{
			return m_x;
		}
		
		public function getY(): int
		{
			return m_y;
		}
				
	}

}