package bel.level 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
		
	/**
	 * TODO
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Tile extends Entity
	{
		static public const SIZE_IN_PIXELS:int = 32;

		private var m_tileMap:Tilemap;
		private var m_row:int;
		private var m_column:int;
		
		public function Tile(map:Tilemap, i:int, j:int) 
		{
			m_tileMap = map;
			m_column = j;
			this.x = m_column * SIZE_IN_PIXELS;
			m_row = i;
			this.y = m_row * SIZE_IN_PIXELS;
		}
		
		protected function set tileIndexType(index:int):void
		{
			m_tileMap.setTile(m_column, m_row, index);
		}
	}

}