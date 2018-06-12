package com.gsccs.tobacco.utils
{
	public class CicleLayout
	{
		public function CicleLayout()
		{
		}
		
		
		private const CENTRE:Point = new Point(0, 0); //圆心 
		
		private const RADIUS:Number = 100; //半径 
		
		private const START_ANGLE:Number = 15; //起初角度 
		
		private const Tile_TOTAL:Number = 9; //组件个数 
		
		private const SINGLE_ANGLE:Number = 360 / Tile_TOTAL; //平均角度 
		
		
		
		for(var i:uint=0; i<Tile_TOTAL; i++){ 
			
			var pb:Tile = new Tile(); //新建组件 
			
			var angle:uint = i * SINGLE_ANGLE + START_ANGLE; //角度 
			
			var p:Point = getPoint(angle); 
			
			pb.x = p.x; pb.y = p.y; //移动组件 
			
			pb.rotation = angle - 90; //旋转组件 
			
			this.addElement(pb); //加到舞台 
			
		} 
		
		
		
		private function getPoint(angle:uint):Point{ 
			
			var angleRadians:Number = angle * Math.PI / 180; //换算成弧度 
			
			var p:Point = new Point(Math.cos(angleRadians) * RADIUS, Math.sin(angleRadians) * RADIUS); //计算偏移量 
			
			p.x += CENTRE.x; //跟据圆心对偏移量进行修正 
			
			p.y += CENTRE.y; //跟据圆心对偏移量进行修正 
			
			return p; 
			
		}
	}
}