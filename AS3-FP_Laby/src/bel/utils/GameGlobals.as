package bel.utils 
{
	import bel.character.Player;
	import bel.level.GridMap;
	import bel.level.ScrollingCamera;
	
	/**
	 * 
	 */
	public class GameGlobals 
	{
		private static var m_instance: GameGlobals;
		
		private var m_player: Player;
		private var m_gridMap: GridMap;
		private var m_camera: ScrollingCamera;
		
		public static function getInstance(): GameGlobals {
			if (m_instance == null) {
				m_instance = new GameGlobals();
			}
			return m_instance;
		}
		
		public function setPlayer(player: Player):void {
			m_player = player;
		}
		
		public function getPlayer(): Player {
			return m_player;
		}
		
		public function setGridMap(gridMap: GridMap):void {
			m_gridMap = gridMap;
		}
		
		public function getGridMap(): GridMap {
			return m_gridMap;
		}
		
		public function setCamera(camera: ScrollingCamera): void {
			m_camera = camera;
		}
		
		public function getCamera(): ScrollingCamera {
			return m_camera;
		}
		
	}

}