package bel.level 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import bel.character.Player;
	import bel.graphics.HUD;
	import bel.utils.GameGlobals;
	
	/**
	 * Description of a level
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Level extends World
	{
		private var m_initialised:Boolean = false;
		private var m_pause:Boolean = false;
		
		public function Level(levelFile:String)
		{
			var globals: GameGlobals = GameGlobals.get;

			globals.level = this;

			globals.gridMap = new GridMap();
			add(globals.gridMap);
			
			add(new HUD());
			
			globals.player = new Player;
			add(globals.player);
			
			globals.camera = new ScrollingCamera();

			readXML("levels/" + levelFile + ".xml");
		}
		
		public function initConfig(data:XML):void
		{
			var globals: GameGlobals = GameGlobals.get;

			globals.gridMap.initConfig(new XML(data.gridmap));

			globals.camera.speed = data.camera.@speed;
			
			m_initialised = true;
		}
		
		override public function update():void  
		{
			if (m_initialised) {
				if (!m_pause) {
					super.update();
					var progress:Number = GameGlobals.get.camera.update();
					if (!GameGlobals.get.gridMap.clamp(progress)) {
						FP.log("Level end !");
						m_pause = true;
					}
				}
				cheatCodes();
			}
		}
		
		public function cheatCodes():void 
		{
			var globals: GameGlobals = GameGlobals.get;
			if (Input.check(Key.NUMPAD_8)) {
				globals.camera.speed = -50;
			} else if (Input.check(Key.NUMPAD_5)) {
				globals.camera.speed = 0;
			} else if (Input.check(Key.NUMPAD_2)) {
				globals.camera.speed = 50;				
			}
			if (Input.check(Key.P)) {
				m_pause = !m_pause;
			}
		}
		
		private function readXML(levelFile:String):void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(new URLRequest(levelFile));
			loader.addEventListener(Event.COMPLETE,
				function processXML(e:Event):void { GameGlobals.get.level.initConfig(new XML(e.target.data)); }
			);
			loader.addEventListener(IOErrorEvent.IO_ERROR,
				function errorXML(e:Event):void { trace("Error while loading XML : " + e); }
			);
		}
	}
}