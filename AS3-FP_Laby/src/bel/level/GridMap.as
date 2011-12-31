package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import bel.utils.DynGraphic;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * Container for tiles
	 * NOTE: TileMap.floodFill == pot de peinture
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class GridMap extends Entity
	{
		private var m_width:int;
		private var m_height:int;

		private var m_tileMap:Tilemap; // Useful to render many tiles efficiently
		private var labyLines:Array = new Array();
		
		public function GridMap(width:int, height:int)
		{
			m_width = width;
			m_height = height;
			new DynGraphic("assets/tilesheet.png", this,
				function assign(img:BitmapData, g:GridMap):void { g.tileSheet = img; } );
			layer = 9;
		}
		
		public function set tileSheet(img:BitmapData):void
		{
			m_tileMap = new Tilemap(img,
				m_width * Tile.SIZE_IN_PIXELS, m_height * Tile.SIZE_IN_PIXELS,
				Tile.SIZE_IN_PIXELS, Tile.SIZE_IN_PIXELS);
			graphic = m_tileMap;
			loadLevel();
		}
		
		public function loadLevel():void
		{
			// TODO; include from XML
			// NOTE: loadFromString() bug with column = 0, row = 0, index = 1
			for (var i:int = 0; i < m_height; ++i) {
				labyLines[i] = new Array();
				labyLines[i][0] = new EmptyFloor(m_tileMap, i, 0);
				//labyLines[i][0].appearOnGrid();
				labyLines[i][m_width - 1] = new EmptyFloor(m_tileMap, i, m_width - 1);
				//labyLines[i][m_width - 1].appearOnGrid();
				for (var j:int = 1; j < m_width - 1; ++j) {
					if (!(i % 3) && (j % 6))
						labyLines[i][j] = new StaticObstacle(m_tileMap, i, j);
					else
						labyLines[i][j] = new EmptyFloor(m_tileMap, i, j);
					//labyLines[i][j].appearOnGrid();
				}
			}
		}
		
		/**
		 * Perform progressive loading of the map (=> less rendering & collision calculus)
		 */
		public function clamp(progress:Number):void
		{
			//trace(progress / Tile.SIZE_IN_PIXELS);
		}
	}
}