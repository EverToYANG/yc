
package com.gsccs.tobacco.events
{
	import com.supermap.framework.events.BaseEvent;
	
	import flash.events.Event;

	public class MenuClickEvent extends Event
	{
		/**
		 *  当菜单点击时派发该事件
		 */
		public static const MENU_CLICK:String = "menuClick";
		
		private var _data:Object = null;
		
		
		public function get data():Object
		{
			return _data;
		}

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function MenuClickEvent(type:String,  data:Object=null)
		{
			super(type);
			if (data != null) 
				_data = data;
		}
	}
}