package bel.character 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import bel.utils.dynamicGraphicLoader;
	import bel.level.Tile;
	
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
			dynamicGraphicLoader("charset.png", initAnim);
			this.layer = 5;
			this.type = "player";
			this.width = Tile.SIZE_IN_PIXELS;
			this.height = Tile.SIZE_IN_PIXELS;
			this.setHitbox(this.width, this.height, 0, -this.height);
		}
		
		private function initAnim(img:BitmapData):void
		{
			m_anim = new Spritemap(img, 32, 64);
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
			updatePosition();
			super.update();
		}
		
		public function updatePosition(): void
		{
			var animDirection: String = getAnimDirection();
			for (var i: int = 0; i < m_speed; i++) {
				if (Input.check(Key.UP)) {
					if (!collide("obstacle", this.x, this.y - 1)) {
						this.y -= 1;
						animDirection = "up";
					}
				} 
				if (Input.check(Key.DOWN)) {
					if (!collide("obstacle", this.x, this.y + 1)) {
						this.y += 1;
						animDirection = "down";
					}
				} 
				if (Input.check(Key.LEFT)) {
					if (!collide("obstacle", this.x - 1, this.y)) {
						this.x -= 1;
						animDirection = "left";
					}
				} 
				if (Input.check(Key.RIGHT)) {
					if (!collide("obstacle", this.x + 1, this.y)) {
						this.x += 1;
						animDirection = "right";
					}
				} 				
			}
			if (Input.check(Key.CONTROL)) {
				rush();
			} else {
				stopRush();
			}
			setAnimDirection(animDirection);
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