package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import bel.utils.assert;
	import bel.utils.GameGlobals;
	import bel.utils.dynamicGraphicLoader;
	
	/**
	 * Container for tiles
	 * NOTE: TileMap.floodFill == pot de peinture
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class GridMap extends Entity
	{
		private const ASCII_ROW_SEP:String = "\n";
		
		private var m_initialised:Boolean = false;
		private var m_widthInTiles:int = 0;
		private var m_heightInTiles:int = 0;
		private var m_lenghtInTiles:int = 0;
		private var m_progressInTiles:int = 0;

		private var m_loadedMap:XML;

		private var m_tileMap:Tilemap; // Useful to render many tiles efficiently
		private var labyLines:Array = new Array();
		
		public function GridMap()
		{
			m_heightInTiles = FP.height / Tile.SIZE_IN_PIXELS + 1;;
			this.layer = 9;
		}
		
		public function initConfig(data:XML):void
		{
			m_loadedMap = data;
			var stringMap:String = new String(m_loadedMap);
			var asciiMap:Array = stringMap.split(ASCII_ROW_SEP);
			m_widthInTiles = asciiMap[0].length;
			m_lenghtInTiles = asciiMap.length;
			trace("Level length: " + m_lenghtInTiles);
			assert(m_lenghtInTiles > m_heightInTiles);
			dynamicGraphicLoader("tilesheet.png", setTileSheet);
		}

		public function setTileSheet(img:BitmapData):void
		{
			this.graphic = m_tileMap = new Tilemap(img,
				m_widthInTiles * Tile.SIZE_IN_PIXELS, m_lenghtInTiles * Tile.SIZE_IN_PIXELS,
				Tile.SIZE_IN_PIXELS, Tile.SIZE_IN_PIXELS);
			width = m_tileMap.width;
			height = m_tileMap.height;
			// Centering camera
			GameGlobals.get.camera.xOffset = (FP.width - width) / 2;
			loadMap();
		}

		public function loadMap():void
		{
			var stringMap:String = new String(m_loadedMap);
			var asciiMap:Array = stringMap.split(ASCII_ROW_SEP);

			// NOTE: loadFromString() bug with column = 0, row = 0, index = 1
			for (var i:int = 0; i < m_lenghtInTiles; ++i) {
				labyLines[i] = new Array();
				for (var j:int = 0; j < m_widthInTiles; ++j) {
					switch(asciiMap[i].charAt(j)) {
					case "x" :
						labyLines[i][j] = new StaticObstacle(m_tileMap, i, j);
						break;
					default:
						labyLines[i][j] = new EmptyFloor(m_tileMap, i, j);
						break;
					}
					if (i < m_heightInTiles)
						labyLines[i][j].appearOnGrid();
				}
			}
			m_initialised = true;
		}
		
		/**
		 * Perform progressive loading of the map (=> less rendering & collision calculus)
		 */
		public function clamp(progress:Number):Boolean
		{
			if (!m_initialised)
				return true;
			var currentProgressInTiles:int = progress / Tile.SIZE_IN_PIXELS;
			if (currentProgressInTiles + m_heightInTiles > m_lenghtInTiles)
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