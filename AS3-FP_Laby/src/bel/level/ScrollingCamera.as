package bel.level 
{
	import net.flashpunk.FP;
	
	/**
	 * My name is Lucas Cimon and I never write (useful) comments
	 */
	public class ScrollingCamera 
	{
		private var m_x:Number; // private because when they are modified, 
		private var m_y:Number; // FP.camera also has to be modified
		public var m_speed:Number;
		
		public function ScrollingCamera() 
		{
			m_x = 0;
			m_y = 0;
			m_speed = 0;
		}
		
		public function update():Number
		{
			return setY(getY() + FP.elapsed * m_speed);
		}
		
		public function setX(x: Number): Number 
		{
			m_x = x;
			FP.camera.x = m_x;
			return m_x;
		}
		
		public function setY(y: Number): Number 
		{
			m_y = y;
			FP.camera.y = m_y;
			return m_y;
		}
		
		public function getX(): Number
		{
			return m_x;
		}
		
		public function getY(): Number
		{
			return m_y;
		}
				
	}

}