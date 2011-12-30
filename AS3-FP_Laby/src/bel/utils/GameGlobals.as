package bel.utils 
{
	import bel.character.Player;
	import bel.level.GridMap;
	import bel.level.Level;
	import bel.level.ScrollingCamera;
	
	/**
	 * 
	 */
	public class GameGlobals 
	{
		private static var m_instance: GameGlobals;
		
		public var level: Level;
		public var player: Player;
		public var gridMap: GridMap;
		public var camera: ScrollingCamera;
		
		public static function get get(): GameGlobals {
			if (m_instance == null) {
				m_instance = new GameGlobals();
			}
			return m_instance;
		}
	}

}