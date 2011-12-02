package bel.level 
{
	import net.flashpunk.World;
	import bel.level.Background;

	public class Level extends World
	{
		public function Level()
		{
			add(new Background());
		}
	}

}