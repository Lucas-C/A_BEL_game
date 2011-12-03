package bel.utils
{
	import flash.system.fscommand;

	public function assert(expression:Boolean):void
	{
		CONFIG::debug {
			if (!expression)
				throw new Error("Assertion failed!");
		}
	}
}
