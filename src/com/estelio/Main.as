package com.estelio
{
	import com.estelio.event.CustomEvent;
	import com.estelio.ui.CustomButton;
	import com.estelio.ui.News;
	import com.estelio.ui.TabGroup;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.TweenPlugin;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class Main extends MovieClip
	{
		
		private const urlList:Array = new Array("http://feeds.bbci.co.uk/news/world/rss.xml",
												"http://feeds.bbci.co.uk/news/uk/rss.xml",
												"http://feeds.bbci.co.uk/news/business/rss.xml");
		
		private var buttonList:Array = new Array();
		private var feederList:Array = new Array();
		private var news:News = new News();
		private var tabGroup:TabGroup;
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init():void
		{
			TweenPlugin.activate([ColorTransformPlugin]);
			
			addChild(news);
			
			//create buttons and feeders
			for (var i:int = 0; i < urlList.length; i++)
			{
				var btn:CustomButton = new CustomButton();
				btn.x = (btn.width + 5) * i + btn.width * .5;
				btn.y = 320;
				btn.id = i;
				btn.addEventListener(MouseEvent.CLICK, btnClicked);
				addChild(btn);
				buttonList.push(btn);
				
				var feeder:Feeder = new Feeder(urlList[i]);
				feeder.id = i;
				feeder.addEventListener(CustomEvent.READY, onReadyHandler);
				feederList.push(feeder);
			}
			
			//control buttons as tabs
			tabGroup = new TabGroup(buttonList);
		}
		
		private function btnClicked(e:MouseEvent):void
		{
			var btn:CustomButton = CustomButton(e.target);
			tabGroup.activeTab = btn;
			Feeder(feederList[btn.id]).load();
		}
		
		private function onReadyHandler(e:CustomEvent):void
		{
			var id:int = Feeder(e.target).id;
			var btn:CustomButton = CustomButton(buttonList[id]);
			btn.label = e.data.channel.title;
			
			if (btn.selected)
			{
				news.data = XML(e.data);
			}
		}
	
	}

}