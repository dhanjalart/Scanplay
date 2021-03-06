package com.trebuchet.views
{
	import com.core.mvc.View;
	import com.trebuchet.config.GameConfig;

	public class GameViewBase extends View
	{
		//list of all the game views
		public static const MAIN_MENU_VIEW:String="MainMenuView";
		public static const OPTIONS_MENU_VIEW:String="OptionsMenuView";
		public static const GAME_STORE_VIEW:String="GameStoreView";
		public static const GAME_VIEW:String="GameView";
		public static const TEST_VIEW:String="TestView";
		public static const EDITOR_VIEW:String="EditorView";
		
		public function GameViewBase(_name:String)
		{
			super(_name);
		}
	}
}