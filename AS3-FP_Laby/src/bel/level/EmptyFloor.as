package bel.level 
{
	import net.flashpunk.graphics.Tilemap;

	/**
	 * TODO
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class EmptyFloor extends Tile
	{
		public function EmptyFloor(map:Tilemap, i:int, j:int)
		{
			super(map, i, j);
			tileIndexType = 0;
		}
	}
}