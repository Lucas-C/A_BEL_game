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
		private var m_tileMap:Tilemap;
		private var m_row:int;
		private var m_column:int;
		
		public function Tile(map:Tilemap, i:int, j:int) 
		{
			m_tileMap = map;
			m_row = i;
			m_column = j;
		}
		
		protected function set tileIndexType(index:int):void
		{
			m_tileMap.setTile(m_column, m_row, index);
		}
	}

}