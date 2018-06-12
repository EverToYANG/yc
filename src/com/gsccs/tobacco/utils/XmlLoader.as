
package com.gsccs.tobacco.utils
{
	/**
	 * 主配置文件
	 */
	
	
	import com.gsccs.tobacco.events.DataConfigEvent;
	import com.gsccs.tobacco.model.Jyjg;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	
	[Event(name="footload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="dtjjload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="jieshaoload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="whhdload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="mapload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="whscload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="flfgload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="yxfwload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="jymlload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="cjwtload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="gkgsload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="hlbjload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	[Event(name="jyjgload", type="com.gsccs.tobacco.events.DataConfigEvent")]
	
	public class XmlLoader extends EventDispatcher
	{		
		private var configXML:String = "app-config.xml";
		
		
		private var foots:Array;
		private var dtjjs:Array;
		private var jieshaos:Array;
		private var whhds:Array;
		private var maps:Array;
		private var whscs:Array;
		private var flfgs:Array;
		private var yxfws:Array;
		private var cjwts:Array;
		private var gkgss:Array;
		private var hlbjs:Array;
		private var jymls:ArrayCollection;
		
		private var jyjg:Jyjg;
		public function XmlLoader()
		{			
			configLoad();
		}
		
		
		private function configLoad():void
		{
			
			var configService:HTTPService = new HTTPService();			
			configService.url = configXML;
			configService.resultFormat = "e4x";
			configService.addEventListener(ResultEvent.RESULT, configResult);
			configService.addEventListener(FaultEvent.FAULT, configFault);	
			configService.send();
		}
		
		
		
		private function configResult(event:ResultEvent):void
		{						
			var configData:XML = event.result as XML;
			
			var footList:XMLList = configData.foot;
			var dtjjList:XMLList = configData.dtjj;
			var jieshaoList:XMLList = configData.jieshao;
			var whhdList:XMLList = configData.whhd;
			var mapList:XMLList = configData.map;
			var whscList:XMLList = configData.whsc;
			var flfgList:XMLList = configData.flfg;
			var yxfwList:XMLList = configData.yxfw;
			var jymlList:XMLList = configData.jyml;
			var cjwtList:XMLList = configData.cjwt;
			var gkgsList:XMLList = configData.gkgs;
			var hlbjList:XMLList = configData.hlbj;
			
			foots = new Array();
			dtjjs = new Array();
			jieshaos = new Array();
			whhds = new Array();
			maps = new Array();
			whscs = new Array();
			flfgs = new Array();
			yxfws = new Array();
			cjwts = new Array();
			gkgss = new Array();
			hlbjs = new Array();
			jymls = new ArrayCollection();
			
			
			for each(var whhdXML:XML in whhdList)
			{
				
				var whhdMsgObj:Object = 
				{		
					source: whhdXML.@source[0],
					width : whhdXML.@width[0],
					height :　whhdXML.@height[0],
					name : whhdXML.@name[0],
					icon : whhdXML.@icon[0],
					title : whhdXML.@title[0],
					id : whhdXML.@id[0],
					describe : whhdXML.@describe[0]
				}
				whhds.push(whhdMsgObj);
			}
			for each(var mapXML:XML in mapList)
			{
				
				var mapMsgObj:Object = 
					{		
						source: mapXML.@source[0],
							width : mapXML.@width[0],
							height :　mapXML.@height[0],
							name : mapXML.@name[0],
							icon : mapXML.@icon[0],
							title : mapXML.@title[0],
							id : mapXML.@id[0],
							describe : mapXML.@describe[0]
					}
				maps.push(mapMsgObj);
			}
			
			
			for each(var whscXML:XML in whscList)
			{
				var whscMsgObj:Object = 
					{		
						source: whscXML.@source[0],
						title : whscXML.@title[0],
						id : whscXML.@id[0]
					}
				whscs.push(whscMsgObj);
			}
			
			
			for each(var flfgXML:XML in flfgList)
			{
				
				var captions:ArrayCollection = new ArrayCollection();
				var captionList:XMLList = flfgXML.caption;
				for each(var captionxml:XML in captionList)
				{
					var captionObj:Object = 
					{		
						id : captionxml.@id[0],
						title : captionxml.@title[0],
						type : captionxml.@type[0],
						source: captionxml.@source[0]
					}
					captions.addItem(captionObj);
					//.push(itemObj);
				}
				var flfgObj:Object = 
					{	
						id : flfgXML.@id[0],
						source: flfgXML.@source[0],
						title : flfgXML.@title[0],
						captions : captions
					}
				flfgs.push(flfgObj);
			}
			
			for each(var yxfwXML:XML in yxfwList)
			{
				
				var yxfwItems:Array = new Array();
				var yxfwItemList:XMLList = yxfwXML.item;
				for each(var yxfwItemxml:XML in yxfwItemList)
				{
					var yxfwitemObj:Object = 
						{		
							id : yxfwItemxml.@id[0],
							title : yxfwItemxml.@title[0],
							type : yxfwItemxml.@type[0],
							spec : yxfwItemxml.@spec[0],
							barcode: yxfwItemxml.@barcode[0],
							pfprice:yxfwItemxml.@pfprice[0],
							lsprice:yxfwItemxml.@lsprice[0],
							source: yxfwItemxml.@source[0],
							desc:yxfwItemxml.@desc[0]
								
						}
					yxfwItems.push(yxfwitemObj);
				}
				
				var yxfwObj:Object = 
					{	
						id : yxfwXML.@id[0],
						source: yxfwXML.@source[0],
						title : yxfwXML.@title[0],
						width : yxfwXML.@width[0],
						height : yxfwXML.@height[0],
						imgbtn :yxfwXML.@imgbtn[0],
						items :yxfwItems
					}
				yxfws.push(yxfwObj);
			}
			
			for each(var jymlXML:XML in jymlList)
			{
				var jymlObj:Object = 
					{	
						id : jymlXML.@id[0],
						corptitle: jymlXML.@corptitle[0],
						spectitle : jymlXML.@spectitle[0],
						barcode : jymlXML.@barcode[0],
						grade : jymlXML.@grade[0],
						cprice : jymlXML.@cprice[0],
						pprice : jymlXML.@pprice[0],
						image : jymlXML.@image[0]
					}
				jymls.addItem(jymlObj);
			}
			
			
			for each(var cjwtXML:XML in cjwtList)
			{
				
				var cjwtMsgObj:Object = 
					{		
						id : cjwtXML.@id[0],
						source: cjwtXML.@source[0],
						title : cjwtXML.@title[0],
						width : cjwtXML.@width[0],
						height : cjwtXML.@height[0],
						imgbtn :cjwtXML.@imgbtn[0]
					}
				cjwts.push(cjwtMsgObj);
			}
			
			for each(var gkgsXML:XML in gkgsList)
			{
				var gkgscaptions:ArrayCollection = new ArrayCollection();
				var gkgscaptionList:XMLList = gkgsXML.item;
				for each(var gkgscaptionxml:XML in gkgscaptionList)
				{
					var gkgscaptionObj:Object = 
						{		
							id : gkgscaptionxml.@id[0],
							title : gkgscaptionxml.@title[0],
							type : gkgscaptionxml.@type[0],
							source: gkgscaptionxml.@source[0]
						}
					gkgscaptions.addItem(gkgscaptionObj);
				}
				var gkgsMsgObj:Object = 
					{		
						source: gkgsXML.@source[0],
						title : gkgsXML.@title[0],
						id : gkgsXML.@id[0],
						captions:gkgscaptions
					}
				gkgss.push(gkgsMsgObj);
			}
			
			for each(var hlbjXML:XML in hlbjList)
			{
				var hlbjcaptions:ArrayCollection = new ArrayCollection();
				var hlbjcaptionList:XMLList = hlbjXML.item;
				for each(var hlbjcaptionxml:XML in hlbjcaptionList)
				{
					var hlbjcaptionObj:Object = 
						{		
							id : hlbjcaptionxml.@id[0],
							title : hlbjcaptionxml.@title[0],
							type : hlbjcaptionxml.@type[0],
							source: hlbjcaptionxml.@source[0]
						}
					hlbjcaptions.addItem(hlbjcaptionObj);
				}
				
				var hlbjMsgObj:Object = 
					{		
						source: hlbjXML.@source[0],
						title : hlbjXML.@title[0],
						id : hlbjXML.@id[0],
						captions:hlbjcaptions
					}
				hlbjs.push(hlbjMsgObj);
			}
			
			for each(var jieshaoXML:XML in jieshaoList)
			{
				var jieshaoMsgObj:Object = 
					{		
						id : jieshaoXML.@id[0],
						title : jieshaoXML.@title[0],
						source: jieshaoXML.@source[0]
						
					}
				jieshaos.push(jieshaoMsgObj);
			}
			
			
			for each(var dtjjXML:XML in dtjjList)
			{
				
				var items:Array = new Array();
				var itemList:XMLList = dtjjXML.item;
				for each(var itemxml:XML in itemList)
				{
					var itemObj:Object = 
					{		
						id : itemxml.@id[0],
						title : itemxml.@title[0],
						type : itemxml.@type[0],
						source: itemxml.@source[0]
								
					}
					items.push(itemObj);
				}
				
				var dtjjMsgObj:Object = 
				{		
					id : dtjjXML.@id[0],
					title : dtjjXML.@title[0],
					items: items
							
				}
				dtjjs.push(dtjjMsgObj);
			}
			
			
			
			for each(var footXML:XML in footList)
			{
				var footMsgObj:Object = 
					{		
						source: footXML.@source[0],
						title : footXML.@title[0],
						id : footXML.@id[0]
					}
				foots.push(footMsgObj);
			}
			
			
			if (foots){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.FOOT_LOAD,foots));
			}
			
			
			if (dtjjs){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.DTJJ_LOAD,dtjjs));
			}
			
			if (jieshaos){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.JIESHAO_LOAD,jieshaos));
			}
			
			if (flfgs){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.FLFG_LOAD,flfgs));
			}
			
			if (yxfws){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.YXFW_LOAD,yxfws));
			}
			
			if (jymls){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.JYML_LOAD,jymls));
			}
			
			if (whhds){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.WHHD_LOAD,whhds));
			}
			
			if (maps){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.MAP_LOAD,maps));
			}
			
			if (whscs){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.WHSC_LOAD,whscs));
			}
			
			if (cjwts){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.CJWT_LOAD,cjwts));
			}
			
			if (gkgss){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.GKGS_LOAD,gkgss));
			}
			
			
			if (hlbjs){
				dispatchEvent(new DataConfigEvent(DataConfigEvent.HLBJ_LOAD,hlbjs));
			}
			
		}
		
		/**
		 *  当主配置文件解析失败时 派发CONFIG_LOAD_ERROR事件
		 */
		private function configFault(event:FaultEvent):void
		{			
			this.dispatchEvent(new DataConfigEvent(DataConfigEvent.CONFIG_LOAD_ERROR, event.fault));
		}		
	}
}