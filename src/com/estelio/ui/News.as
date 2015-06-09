package com.estelio.ui
{
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class News extends MovieClip
	{
		private var _data:XML;
		private var content:Sprite;
		private var container:Sprite = new Sprite();
		
		public function News()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//set scroll pane and its source
			addChild(container);
			ScrollPane(content_scrl).source = container;
		}
		
		public function get data():XML
		{
			return _data;
		}
		
		public function set data(value:XML):void
		{
			_data = value;
			
			//remove previous content
			if (container && content && container.contains(content))
			{
				container.removeChild(content);
			}
			
			//create a new content
			content = new Sprite();
			container.addChild(content);
			
			//place news in the content
			for (var i:int = 0; i < value.channel.item.length(); i++)
			{
				var item:NewsDetail = new NewsDetail(value.channel.item[i]);
				item.x = (item.width + 5) * i;
				content.addChild(item);
			}
			ScrollPane(content_scrl).update();
		}
	
	}

}