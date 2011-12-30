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
		
		private var m_tileMap:Tilemap;
		private var labyLines:Array = new Array();
		
		public function GridMap()
		{
			new DynGraphic("assets/tilesheet.png", this,
				function assign(img:BitmapData, g:GridMap):void { g.tileSheet = img; } );
			layer = GRIDMAP_LAYER;
		}
		
		public function set tileSheet(img:BitmapData):void
		{
			m_tileMap = new Tilemap(img, 128, 128, 32, 32);
			graphic = m_tileMap;
			m_tileMap.loadFromString("\
				1, 0, 1, 0\n\
				0, 1, 1, 1\n\
				1, 0, 1, 0\n\
				0, 0, 0, 1\n\
			", ",", "\n"); // BUGGED ?
		}
		
		public function loadLevel():void
		{
			// loadFromString();
		}

		override public function update():void 
		{
			super.update();
			// test: floodFill() & shiftTiles()
		}		
	}
}