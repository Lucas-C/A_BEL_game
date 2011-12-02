package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import scene.Viewer;
	
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(1024, 640, 60, false);
			FP.world = new Viewer();
		}
	}
	
}