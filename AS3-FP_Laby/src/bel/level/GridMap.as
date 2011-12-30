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
		private const GRIDMAP_LAYER:int = 9;
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
			layer = GRIDMAP_LAYER;
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
			for (var i:int = 0; i < m_width; ++i) {
				m_tileMap.setTile(i, 0, 0);
				m_tileMap.setTile(i, m_height - 1, 0);
				for (var j:int = 1; j < m_height - 1; ++j)
					m_tileMap.setTile(i, j, i % 2);
			}
		}

		override public function update():void 
		{
			super.update();
			// test: floodFill() & shiftTiles()
		}		
	}
}