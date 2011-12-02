package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import bel.level.Level;
	
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(1024, 768, 60, false);
			FP.world = new Level();
		}
	}
	
}