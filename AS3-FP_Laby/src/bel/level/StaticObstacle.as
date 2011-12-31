package bel.level 
{
	import net.flashpunk.graphics.Tilemap;

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
		}
	}
}