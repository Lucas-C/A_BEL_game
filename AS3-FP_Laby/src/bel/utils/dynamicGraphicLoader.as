package bel.utils
{
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.net.URLRequest;

	/**
	 * Dynamically load images.
	 * @author Lucas Cimon, Benoît Morel
	 * @param f function taking as argument a BitmapData
	 */
	public function dynamicGraphicLoader(filename:String, callback:Function):void
	{
		var imgLoader:Loader = new Loader();
		imgLoader.contentLoaderInfo.addEventListener(Event.INIT,
			function imgLoadingCallback():void {
				assert(imgLoader.content != null); // If it fails, image wasn't found
				var bitmap:Bitmap = Bitmap(imgLoader.content);
				var bitmapData:BitmapData = bitmap.bitmapData;
				callback(bitmapData);
			}
		);
		//imgLoader.contentLoaderInfo.addEventListener(Event.CANCEL, FP.log);
		imgLoader.load(new URLRequest("assets/" + filename));
	}
}
