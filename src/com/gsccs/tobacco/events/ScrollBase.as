package com.gsccs.tobacco.events
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	
	import spark.components.Group;
	
	
	
	public class ScrollBase
	{
		//public static const BACK_MAIN:String = "backMain";
		private  var box:Sprite;
		private  var sprite:Sprite;
		private  var beginPointX:Number;
		private  var beginPointY:Number;
		private  var lastPointX:Number;
		private  var lastPointY:Number;
		private  var isClick:Boolean;
		private  var object:Group;
		private  var oParent:DisplayObject;
		
		
		public function ScrollBase():void {
		
		}
		
		public  function init(o:Group):void
		{
			object = o as Group;
			object.addEventListener(MouseEvent.MOUSE_DOWN,onBeginTouch);
			object.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
			object.addEventListener(MouseEvent.MOUSE_UP,onEndTouch);
			object.addEventListener(MouseEvent.MOUSE_OUT,onOut);
		}
		
		private  function onBeginTouch(e:MouseEvent):void
		{
			
			//Alert.show("onBeginTouch");
			isClick=true;
			beginPointX = e.stageX;
			beginPointY = e.stageY;
		}
		
		private  function onMove(e:MouseEvent):void
		{
			
			//Alert.show("onMove");
			if(isClick)
			{
				lastPointX = e.stageX;
				lastPointY = e.stageY;
				object.verticalScrollPosition -= (lastPointY-beginPointY);
				object.horizontalScrollPosition -=(lastPointX-beginPointX);
				beginPointX = lastPointX;
				beginPointY = lastPointY;
			}
		}
		
		private  function onEndTouch(e:MouseEvent):void
		{
			
			//Alert.show("onEndTouch");
			isClick=false;
		}
		
		private  function onOut(e:MouseEvent):void
		{
			
			//Alert.show("onOut");
			oParent = object;
			
			var ox:int = object.x;
			var oy:int = object.y;
			var ow:int = object.width;
			var oh:int = object.height;
			
			while(oParent.parent!=null)
			{
				oParent = oParent.parent;
				ox += oParent.x;
				oy += oParent.y;
			}
			
			if(e.stageX>(ox+ow)||e.stageX<ox||e.stageY>(oy+oh)||e.stageY<oy)
			{
				isClick=false;
			}
		}
	}
}

