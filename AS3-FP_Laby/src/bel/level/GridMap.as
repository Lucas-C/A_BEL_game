package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import bel.utils.DynGraphic;
	
	/**
	 * Container for tiles
	 * NOTE: TileMap.floodFill == pot de peinture
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class GridMap extends Entity
	{
		private var m_initialised:Boolean = false;
		private var m_widthInTiles:int;
		private var m_heightInTiles:int;
		private var m_levelLenghtInTiles:int;
		private var m_progressInTiles:int;

		private var m_tileMap:Tilemap; // Useful to render many tiles efficiently
		private var labyLines:Array = new Array();
		
		public function GridMap()
		{
			m_widthInTiles = FP.width / Tile.SIZE_IN_PIXELS;
			m_heightInTiles = FP.height / Tile.SIZE_IN_PIXELS + 1;
			m_progressInTiles = 0
			new DynGraphic("assets/tilesheet.png", this,
				function assign(img:BitmapData, g:GridMap):void { g.tileSheet = img; g.initialised(); } );
			layer = 9;
		}
		
		public function initialised():void
		{
			m_initialised = true;
		}
		
		public function set tileSheet(img:BitmapData):void
		{
			m_levelLenghtInTiles = 64;
			m_tileMap = new Tilemap(img,
				m_widthInTiles * Tile.SIZE_IN_PIXELS, m_levelLenghtInTiles * Tile.SIZE_IN_PIXELS,
				Tile.SIZE_IN_PIXELS, Tile.SIZE_IN_PIXELS);
			graphic = m_tileMap;
			loadLevel();
		}
		
		public function loadLevel():void
		{
			// TODO; include from XML
			// NOTE: loadFromString() bug with column = 0, row = 0, index = 1
			for (var i:int = 0; i < m_levelLenghtInTiles; ++i) {
				labyLines[i] = new Array();
				labyLines[i][0] = new EmptyFloor(m_tileMap, i, 0);
				if (i < m_heightInTiles)
					labyLines[i][0].appearOnGrid();
				labyLines[i][m_widthInTiles - 1] = new EmptyFloor(m_tileMap, i, m_widthInTiles - 1);
				if (i < m_heightInTiles)
					labyLines[i][m_widthInTiles - 1].appearOnGrid();
				for (var j:int = 1; j < m_widthInTiles - 1; ++j) {
					//if (j == 1)
						//trace(i); // WTF ?
					if (!(i % 3) && (j % 6))
						labyLines[i][j] = new StaticObstacle(m_tileMap, i, j);
					else
						labyLines[i][j] = new EmptyFloor(m_tileMap, i, j);
					if (i < m_heightInTiles)
						labyLines[i][j].appearOnGrid();
				}
			}
		}
		
		/**
		 * Perform progressive loading of the map (=> less rendering & collision calculus)
		 */
		public function clamp(progress:Number):Boolean
		{
			if (!m_initialised)
				return true;
			var currentProgressInTiles:int = progress / Tile.SIZE_IN_PIXELS;
			trace(currentProgressInTiles);
			if (currentProgressInTiles + m_heightInTiles > m_levelLenghtInTiles)
				return false;
			// Assume only one line can be skipped at a time
			if (currentProgressInTiles > m_progressInTiles) {
				var j:int;
				for (j = 0; j < m_widthInTiles; ++j)
					labyLines[m_progressInTiles][j].disappearFromGrid();
				for (j = 0; j < m_widthInTiles; ++j)
					labyLines[m_progressInTiles + m_heightInTiles][j].appearOnGrid();
				m_progressInTiles = currentProgressInTiles;
				//m_tileMap.shiftTiles(0, -1);
				//m_tileMap.y += Tile.SIZE_IN_PIXELS;
			}
			return true;
		}
	}
}