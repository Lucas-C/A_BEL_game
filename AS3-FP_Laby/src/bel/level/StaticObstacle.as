package bel.level 
{
	import net.flashpunk.graphics.Tilemap;
	import bel.utils.GameGlobals;

	/**
	 * TODO
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class StaticObstacle extends Tile
	{
		public function StaticObstacle(map:Tilemap, i:int, j:int)
		{
			super(map, i, j);
			this.tileIndexType = 1;
			this.type = "obstacle";
			this.width = Tile.SIZE_IN_PIXELS;
			this.height = Tile.SIZE_IN_PIXELS;
			GameGlobals.get.level.add(this);
		}
	}
}