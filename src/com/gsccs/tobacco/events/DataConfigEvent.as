package com.gsccs.tobacco.events
{
	import flash.events.Event;
	
	public class DataConfigEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		/**
		 * 定义当配置文件载入时，ConfigDataEvent事件对象的type属性。
		 */		
		public static const FOOT_LOAD:String	= "footload";
		public static const DTJJ_LOAD:String	= "dtjjload";
		public static const JIESHAO_LOAD:String	= "jieshaoload";
		public static const WHHD_LOAD:String	= "whhdload";
		public static const MAP_LOAD:String	= "mapload";
		public static const WHSC_LOAD:String	= "whscload";
		public static const FLFG_LOAD:String	= "flfgload";
		public static const JYML_LOAD:String	= "jymlload";
		public static const YXFW_LOAD:String	= "yxfwload";
		public static const CJWT_LOAD:String	= "cjwtload";
		public static const GKGS_LOAD:String	= "gkgsload";
		public static const HLBJ_LOAD:String	= "hlbjload";
		
		
		public static const STYLE_LOAD:String = "styleLoad";
		public static const CONFIG_LOAD_ERROR:String = "configLoadError";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		/**
		 * 处理配置文件数据时，都会将 ConfigDataEvent 对象分派到事件流中。
		 * @param type 定义事件类型。
		 * @param data 定义事件信息。
		 */ 		
		public function DataConfigEvent(type:String,  data:Object=null)
		{
			super(type);
			if (data != null) _data = data;
		}
		
		
		private var _data:Object = null;
		
		public function get data():Object
		{
			return _data;
		}
	}
}