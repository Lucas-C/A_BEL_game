package bel.level 
{
	import bel.character.Player;
	import bel.graphics.HUD;
	import net.flashpunk.World;
	import bel.level.Background;
	import bel.level.GridMap;
	import bel.utils.GameGlobals;
	import net.flashpunk.FP;
	
	/**
	 * Description of a level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Level extends World
	{
		public function Level()
		{
			var globals: GameGlobals = GameGlobals.get;

			globals.level = this;

			add(new Background());

			globals.gridMap = new GridMap(64, 64);
			add(globals.gridMap);
			
			add(new HUD());

			globals.player = new Player;
			add(globals.player);
			
			globals.camera = new ScrollingCamera();
		}
		
		override public function update():void  
		{
			super.update();
			GameGlobals.get.camera.update();

		}
	}
}