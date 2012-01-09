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
			trace("*** Main entry point ***");
			super(800, 600, 30, false);
			FP.world = new Level("rhombus");
			CONFIG::debug {
				FP.console.enable();
			}
		}
	}
}
