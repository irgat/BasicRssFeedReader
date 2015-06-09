package com.estelio.event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class CustomEvent extends Event
	{
		
		public static const READY:String = "READY";
		
		public var data:Object;
		
		public function CustomEvent(_type:String, _data:Object, _bubbles:Boolean = false, _cancelable:Boolean = false)
		{
			super(_type, _bubbles, _cancelable);
			data = _data;
		}
		
		public override function clone():Event
		{
			return new CustomEvent(type, data, bubbles, cancelable);
		}
	
	}

}