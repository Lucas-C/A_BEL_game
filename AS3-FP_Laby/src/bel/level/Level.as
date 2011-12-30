package bel.level 
{
	import bel.character.Player;
	import bel.graphics.HUD;
	import net.flashpunk.World;
	import bel.level.Background;
	import bel.level.GridMap;
	import bel.utils.GameGlobals;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * Description of a level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Level extends World
	{
		public var m_pause:Boolean;
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
			globals.getCamera().m_speed = 50;
			m_pause = false;
			
		}
		
		override public function update():void  
		{
			if (!m_pause) {
				super.update();
				GameGlobals.getInstance().getCamera().update();
			}
			cheatCodes();
		}
		
		public function cheatCodes():void 
		{
			var globals: GameGlobals = GameGlobals.getInstance();
			if (Input.check(Key.NUMPAD_8)) {
				globals.getCamera().m_speed = -50;
			} else if (Input.check(Key.NUMPAD_5)) {
				globals.getCamera().m_speed = 0;
			} else if (Input.check(Key.NUMPAD_2)) {
				globals.getCamera().m_speed = 50;				
			}
			if (Input.check(Key.P)) {
				m_pause = !m_pause;
			}
		}

		

	}

}