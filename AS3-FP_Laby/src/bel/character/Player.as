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
		private const PLAYER_FPS:int = 20;
		private var m_speed:int = 5;
		public var m_anim:Spritemap = new Spritemap(PLAYER_PIC, 32, 32);
		
		public function Player() 
		{
			m_anim.add("up", [0, 7], PLAYER_FPS, true);
			m_anim.add("right", [1, 2], PLAYER_FPS, true);
			m_anim.add("down", [3, 4], PLAYER_FPS, true);
			m_anim.add("left", [5, 6], PLAYER_FPS, true);
			m_anim.play("up");
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
			var animToPlay: String = m_anim.currentAnim;
			for (var i: int = 0; i < m_speed; i++) {
				if (Input.check(Key.UP)) {
					unityGoUp();
					animToPlay = "up";
				} 
				if (Input.check(Key.DOWN)) {
					unityGoDown();
					animToPlay = "down";
				} 
				if (Input.check(Key.LEFT)) {
					unityGoLeft();
					animToPlay = "left";
				} 
				if (Input.check(Key.RIGHT)) {
					unityGoRight();
					animToPlay = "right";
				} 				
			}
			m_anim.play(animToPlay);
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


		
	}

}