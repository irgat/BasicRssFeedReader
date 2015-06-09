package com.estelio.ui
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class NewsDetail extends MovieClip
	{
		
		private var data:XML;
		
		/**
		 * @param	_data
		 */
		public function NewsDetail(_data:XML)
		{
			data = _data;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init():void
		{
			title_txt.text = data.title;
			date_txt.text = data.pubDate;
			description_txt.text = data.description;
			more_txt.htmlText = "<a href='" + data.link + "'><u>click for more</u></a>";
		}
	
	}

}