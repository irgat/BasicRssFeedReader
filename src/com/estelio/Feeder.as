package com.estelio
{
	import com.estelio.event.CustomEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class Feeder extends EventDispatcher
	{
		private var _id:int;
		private var _data:XML;
		private var url:String;
		private var urlLoader:URLLoader = new URLLoader();
		
		/**
		 * @param	_url
		 */
		public function Feeder(_url:String)
		{
			url = _url;
			urlLoader.addEventListener(Event.COMPLETE, dataLoaded);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			load();
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void
		{
			trace("ioError:", e);
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void
		{
			trace("securityError:", e);
		}
		
		private function dataLoaded(e:Event):void
		{
			data = new XML(e.target.data);
			dispatchEvent(new CustomEvent(CustomEvent.READY, data));
		}
		
		public function load()
		{
			urlLoader.load(new URLRequest(url));
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function set id(value:int):void
		{
			_id = value;
		}
		
		public function get data():XML
		{
			return _data;
		}
		
		public function set data(value:XML):void
		{
			_data = value;
		}
	
	}

}