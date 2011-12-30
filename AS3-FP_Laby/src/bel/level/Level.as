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
			var globals: GameGlobals = GameGlobals.getInstance();
			globals.setGridMap(new GridMap(64, 64));
			add(globals.getGridMap());
			add(new Background());
			var player: Player = new Player;
			add(player);
			globals.setPlayer(player);
			add(new HUD());
			globals.setCamera(new ScrollingCamera());
			
		}
		
		override public function update():void  
		{
			super.update();
			GameGlobals.getInstance().getCamera().update();

		}

		

	}

}