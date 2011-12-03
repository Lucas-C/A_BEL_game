package bel.character 
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
	/**
	 * Character controlled by the player
	 * @author Lucas Cimon, Benoît Morel
	 */
	public class Player extends Entity 
	{
		[Embed(source = '../../../assets/playeranim.png')] private const PLAYER_PIC:Class;
		private const PLAYER_LAYER:int = 3;
		private const PLAYER_FPS:int = 5;
		private const RUSH_SPEED:int = 15;
		private const NORMAL_SPEED:int = 5;
		private var m_speed:int = NORMAL_SPEED;
		private var m_animDirection:String = "up";
		private var m_animState:String = "normal";
		public var m_anim:Spritemap = new Spritemap(PLAYER_PIC, 32, 32);
		
		public function Player() 
		{
			m_anim.add("normalup", [0, 7], PLAYER_FPS, true);
			m_anim.add("normalright", [1, 2], PLAYER_FPS, true);
			m_anim.add("normaldown", [3, 4], PLAYER_FPS, true);
			m_anim.add("normalleft", [5, 6], PLAYER_FPS, true);
			m_anim.add("rushup", [8, 15], PLAYER_FPS, true);
			m_anim.add("rushright", [9, 10], PLAYER_FPS, true);
			m_anim.add("rushdown", [11, 12], PLAYER_FPS, true);
			m_anim.add("rushleft", [13, 14], PLAYER_FPS, true);			
			m_anim.play("normalup");
			this.layer = PLAYER_LAYER;
			graphic = m_anim;
			
		}
		
		override public function update():void 
		{
			updatePosition();
			super.update();
		}
		
		override public function render():void 
		{
			super.render();
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