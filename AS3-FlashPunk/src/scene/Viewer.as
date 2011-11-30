package scene 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class Viewer extends World
	{
		public function Viewer()
		{
			add(new Background());
			add(new Logo());
		}
	}
}