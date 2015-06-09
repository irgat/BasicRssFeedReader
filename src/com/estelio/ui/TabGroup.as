package com.estelio.ui
{
	
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class TabGroup
	{
		private var tabList:Array = new Array();
		private var _activeTabId:int;
		private var _activeTab:CustomButton;
		
		/**
		 * @param	_tabList
		 * @param	_activeTabId
		 */
		public function TabGroup(_tabList:Array, _activeTabId:int = 0)
		{
			tabList = _tabList.concat();
			activeTabId = _activeTabId;
		}
		
		public function get activeTabId():int
		{
			return _activeTabId;
		}
		
		public function set activeTabId(value:int):void
		{
			_activeTabId = value;
			for (var i:int = 0; i < tabList.length; i++)
			{
				CustomButton(tabList[i]).selected = i == value;
			}
		}
		
		public function get activeTab():CustomButton
		{
			return _activeTab;
		}
		
		public function set activeTab(value:CustomButton):void
		{
			_activeTab = value;
			activeTabId = tabList.indexOf(value);
		}
	
	}

}