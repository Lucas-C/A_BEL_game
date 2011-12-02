package bel.level 
{
	import bel.character.Player;
	import net.flashpunk.World;
	import bel.level.Background;

	/**
	 * Description of a level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Level extends World
	{
		public function Level()
		{
			add(new Background());
			add(new Player());
		}
	}

}