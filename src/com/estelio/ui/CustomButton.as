package com.estelio.ui
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class CustomButton extends MovieClip
	{
		private const BG_DEFAULT:uint = 0xFFFFFF;
		private const BG_HOVER:uint = 0xCCCCCC;
		private const BG_SELECTED:uint = 0x999999;
		
		private var _label:String = "";
		private var _selected:Boolean = false;
		private var _id:int = -1;
		
		public function CustomButton()
		{
			mouseChildren = false; //disable text field interactions
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		/**
		 * @param	_label
		 * @param	_selected
		 */
		public function init(_label:String = "", _selected:Boolean = false):void
		{
			label = _label;
			selected = _selected;
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			TweenLite.to(bg_mc, .5, {colorTransform: {tint: selected ? BG_SELECTED : BG_DEFAULT, tintAmount: 1}});
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			TweenLite.to(bg_mc, .5, {colorTransform: {tint: BG_HOVER, tintAmount: 1}});
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
			label_txt.text = value;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
			buttonMode = !value;
			mouseEnabled = !value;
			TweenLite.to(bg_mc, .5, {colorTransform: {tint: value ? BG_SELECTED : BG_DEFAULT, tintAmount: 1}});
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function set id(value:int):void
		{
			_id = value;
		}
	
	}

}