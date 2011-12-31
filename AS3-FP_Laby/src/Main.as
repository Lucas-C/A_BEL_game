package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import bel.level.Level;
	
	/**
	 * Program calling point
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(800, 600, 60, false);
			FP.world = new Level();
			CONFIG::debug {
				FP.console.enable();
			}
		}
	}	
}