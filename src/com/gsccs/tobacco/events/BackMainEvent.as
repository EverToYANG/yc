
package com.gsccs.tobacco.events
{
	import com.supermap.framework.events.BaseEvent;
	
	import flash.events.Event;

	public class BackMainEvent extends Event
	{
		/**
		 *  当返回键点击时派发该事件
		 */
		public static const BACK_MAIN:String = "backMain";
		
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
		public function BackMainEvent(type:String,  data:Object=null)
		{
			super(type);
			if (data != null) 
				_data = data;
		}
	}
}