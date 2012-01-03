package bel.level 
{
	import net.flashpunk.FP;
	
	/**
	 * My name is Lucas Cimon and I never write (useful) comments
	 */
	public class ScrollingCamera 
	{
		private var m_x:Number = 0; // private because when they are modified, 
		private var m_y:Number = 0; // FP.camera also has to be modified
		private var m_xOffset:Number = 0;
		public var speed:Number = 0;
		
		public function update():Number
		{
			return setY(getY() + FP.elapsed * speed);
		}
		
		public function set xOffset(x:Number):void
		{
			m_xOffset = x;
			FP.camera.x = m_x - m_xOffset;
		}
		
		public function setX(x: Number): Number 
		{
			m_x = x;
			FP.camera.x = m_x - m_xOffset;
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