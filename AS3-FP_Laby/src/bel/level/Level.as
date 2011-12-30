package bel.level 
{
	import bel.character.Player;
	import net.flashpunk.World;
	import bel.level.Background;
	import bel.level.GridMap;

	/**
	 * Description of a level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Level extends World
	{
		public function Level()
		{
			add(new GridMap());
			add(new Background());
			add(new Player());
		}
		

	}

}