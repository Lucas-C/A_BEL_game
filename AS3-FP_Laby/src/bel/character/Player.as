package bel.character 
{
	import bel.utils.DynGraphic;
	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
	
	/**
	 * Character controlled by the player
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Player extends Entity 
	{
		private const PLAYER_FPS:int = 5;
		private const RUSH_SPEED:int = 15;
		private const NORMAL_SPEED:int = 5;
		private var m_speed:int = NORMAL_SPEED;
		private var m_animDirection:String = "up";
		private var m_animState:String = "normal";
		public var m_anim:Spritemap;
		
		public function Player() 
		{
			new DynGraphic("assets/charset.png", this,
				function assign(img:BitmapData, p:Player):void { p.m_anim = new Spritemap(img, 32, 64); } );
			this.layer = 5;
		}
		
		private function init():void
		{
			m_anim.add("staticdown", [0, 1, 2, 3], PLAYER_FPS, true);
			m_anim.add("staticup", [4, 5, 6, 7], PLAYER_FPS, true);
			m_anim.add("staticleft", [8,9,10,11], PLAYER_FPS, true);
			m_anim.add("staticright", [12, 13, 14, 15], PLAYER_FPS, true);
			m_anim.add("normaldown", [16, 17, 18, 19], PLAYER_FPS, true);
			m_anim.add("normalup", [20, 21, 22, 23], PLAYER_FPS, true);
			m_anim.add("normalleft", [24, 25, 26, 27], PLAYER_FPS, true);
			m_anim.add("normalright", [28, 29, 30, 31], PLAYER_FPS, true);
			m_anim.add("rushup", [8, 15], PLAYER_FPS, true);
			m_anim.add("rushright", [9, 10], PLAYER_FPS, true);
			m_anim.add("rushdown", [11, 12], PLAYER_FPS, true);
			m_anim.add("rushleft", [13, 14], PLAYER_FPS, true);
			m_anim.play("normalup");
			graphic = m_anim;
		}
		
		override public function update():void 
		{
			if (graphic == null && m_anim != null)
				init();
			updatePosition();
			super.update();
		}
		
		public function updatePosition(): void
		{
			var animDirection: String = getAnimDirection();
			for (var i: int = 0; i < m_speed; i++) {
				if (Input.check(Key.UP)) {
					unityGoUp();
					animDirection = "up";
				} 
				if (Input.check(Key.DOWN)) {
					unityGoDown();
					animDirection = "down";
				} 
				if (Input.check(Key.LEFT)) {
					unityGoLeft();
					animDirection = "left";
				} 
				if (Input.check(Key.RIGHT)) {
					unityGoRight();
					animDirection = "right";
				} 				
			}
			if (Input.check(Key.CONTROL)) {
				rush();
			} else {
				stopRush();
			}
			setAnimDirection(animDirection);
		}
		
		public function unityGoUp(): void
		{
			this.y -= 1;
		}
		
		public function unityGoDown(): void
		{
			this.y += 1;
		}
		
		public function unityGoLeft(): void 
		{
			this.x -= 1;
		}
		
		public function unityGoRight(): void
		{
			this.x += 1;
		}
		
		public function setAnimDirection(direction:String): void
		{
			if (getAnimDirection() == direction)
				return;
			m_animDirection = direction;
			m_anim.play(getAnimState() + getAnimDirection());
		}
		
		public function setAnimState(state:String): void
		{
			if (getAnimState() == state)
				return;
			m_animState = state;
			m_anim.play(getAnimState() + getAnimDirection());
		}
		
		public function getAnimDirection():String
		{
			return m_animDirection;
		}
		
		public function getAnimState():String 
		{
			return m_animState;
		}
		
		public function rush():void
		{
			setAnimState("rush");
			m_speed = RUSH_SPEED;
		}
		
		public function stopRush():void
		{
			setAnimState("normal");
			m_speed = NORMAL_SPEED;
		}
		
		public function isRushing():Boolean 
		{
			return getAnimState() == "rush";
		}
		

		
	}

}