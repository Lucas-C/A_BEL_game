package bel.utils 
{
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.net.URLRequest;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	/**
	 * Dynamically load images.
	 * e.graphic will be, sooner or later, loaded with the corresponding asset
	 * @author Lucas Cimon, Benoît Morel 
	 */
	public class DynImage
	{
		static private var m_imageLoader:Loader = new Loader();
		private var m_entity:Entity;
		
		public function DynImage(filename:String, e:Entity)
		{
			m_entity = e;
			m_imageLoader.contentLoaderInfo.addEventListener(Event.INIT, imgLoadingCallback);
			m_imageLoader.load(new URLRequest(filename));
		}
		
		private function imgLoadingCallback (e:Event):void {
			assert(m_imageLoader.content != null);
			var bitmap:Bitmap = Bitmap(m_imageLoader.content);
			var bitmapData:BitmapData = bitmap.bitmapData;
			m_entity.graphic = new Image(bitmapData);
		}
	}

}