package bel.level 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import bel.utils.DynGraphic;
	
	/**
	 * Container for tiles
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class GridMap extends Entity
	{
		private const TILE_SIZE:int = 32;
		
		private var m_width:int;
		private var m_height:int;

		private var m_tileMap:Tilemap;
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
			m_tileMap = new Tilemap(img, m_width * TILE_SIZE, m_height * TILE_SIZE, TILE_SIZE, TILE_SIZE);
			graphic = m_tileMap;
			loadLevel();
		}
		
		public function loadLevel():void
		{
			// NOTE: loadFromString() bug with column = 0, row = 0, index = 1
			for (var i:int = 0; i < m_height; ++i) {
				labyLines[i] = new Array();
				labyLines[i][0] = new EmptyFloor(m_tileMap, i, 0);
				labyLines[i][m_width - 1] = new EmptyFloor(m_tileMap, i, m_width - 1);
				for (var j:int = 1; j < m_width - 1; ++j)
					if (i % 2)
						labyLines[i][j] = new StaticObstacle(m_tileMap, i, j);
					else
						labyLines[i][j] = new EmptyFloor(m_tileMap, i, j);
			}
		}

		override public function update():void 
		{
			super.update();
			// test: floodFill() & shiftTiles()
		}		
	}
}