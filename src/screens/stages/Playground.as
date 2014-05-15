package screens.stages 
{

	import objects.Cube;
	import objects.MapTile;
	import screens.stages.EscMenu;
	import objects.BBot;
	import objects.Hipsbot;
	import objects.MBot;
	import objects.NBot;
	import screens.stages.omaps.ObjectsMap;
	import screens.stages.lmaps.LevelMap;
	import screens.stages.UI;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import flash.ui.Keyboard;
	import starling.display.Button;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author EGOD
	 * 
	 * This class adds the differents layers that are part of our main gameplay, updates them and controls the main input for our game.
	 * Not yet fully implemented
	 * 
	 */
	
	public class Playground extends Sprite 
	{
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		private const SpeedX:Number = 4;
		private const SpeedY:Number = 2;
		
		private var camera_offset_x:int = 400;
		private var camera_offset_y:int = 300;
		
		private var map:LevelMap;
		private var obj:ObjectsMap;
		private var current_robot:Hipsbot;
		private var user_int:UI;
		private var hipstom:Hipstom;
		private var esc_menu:EscMenu;
		
		private var k:int; //iterator
		
		public var scripts:Array = [1,0,0,0,0,0,0];
		
		public function Playground()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.addEventListener(Event.TRIGGERED, changeCurrentRobot);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawGame();
		}
		
		private function drawGame():void 
		{
			map = new LevelMap();
			map.x += camera_offset_x;
			map.y += camera_offset_y;
			
			obj = new ObjectsMap();
			obj.x += camera_offset_x;
			obj.y += camera_offset_y;
			
			user_int = new UI();
			
			hipstom = new Hipstom();
			
			esc_menu = new EscMenu();
			
			this.addChild(map);
			this.addChild(obj);
			this.addChild(user_int);
			this.addChild(hipstom);
			this.addChild(esc_menu);
			
			var i:uint;
			while (current_robot == null)
			{
				current_robot = obj.objectsArray[i][0];
				i++;
			}
			current_robot.state = 1;

		}
		
		private function KeyDown(event:KeyboardEvent):void 
		{
			if (event.keyCode == Keyboard.ESCAPE)
			{
				esc_menu.EscBg.visible = true;
				esc_menu.EscBtn.visible = true;
			}
			
			if (!esc_menu.EscBg.visible) 
			{
				if (!hipstom.visible)
				{
					if (current_robot.state == 1)
					{
						switch (event.keyCode) 
						{
							case Keyboard.W:
								if (current_robot.aim != 8)
								{
									current_robot.aim = 8; 
									current_robot.skeleton.scaleX = -1;
									current_robot.skeleton.skeleton.skinName = "BACK";
									current_robot.skeleton.skeleton.setSlotsToSetupPose();
									current_robot.skeleton.state.setAnimationByName(0, "back_idle", true);
								}
								
								else if (map.matrix[current_robot.i - 1][current_robot.j] == 2)
								{
									if(obj.matrix[current_robot.i - 1][current_robot.j] == 0)
									{
										current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 40; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
											for (var s:int; s < obj.objectsArray[3].length; s++)
											{
												if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
												{
													obj.objectsArray[3][s].interact();
													break;
												}
											}
										}
										else
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 30; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.state = 2;
										current_robot.i--;
										camera_offset_x -= TileSizeX;
										camera_offset_y += TileSizeY;
									}
									else if ((obj.matrix[current_robot.i][current_robot.j] == 1 || obj.matrix[current_robot.i][current_robot.j] == 31 || obj.matrix[current_robot.i][current_robot.j] == 41) && obj.matrix[current_robot.i - 1][current_robot.j] == 5 && obj.matrix[current_robot.i - 2][current_robot.j] == 0 && map.matrix[current_robot.i - 2][current_robot.j] == 2)
									{
										for (k = 0; k < obj.objectsArray[4].length ; k++) 
										{
											if (obj.objectsArray[4][k].i == (current_robot.i - 1) && obj.objectsArray[4][k].j == current_robot.j) 
											{
												obj.objectsArray[4][k].destx = obj.objectsArray[4][k].x + 128;
												obj.objectsArray[4][k].desty = obj.objectsArray[4][k].y - 64;
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 40; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 30; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
												obj.matrix[current_robot.i - 2][current_robot.j] = 5;
												current_robot.i--;
												obj.objectsArray[4][k].i --;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x -= TileSizeX;
												camera_offset_y += TileSizeY;
											}
											break;
										}
									}
									else if (obj.matrix[current_robot.i - 1][current_robot.j] == 14)
									{
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 40; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
										}
										else
										{
											obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 10; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
										current_robot.state = 2;
										current_robot.i--;
										camera_offset_x -= TileSizeX;
										camera_offset_y += TileSizeY;
										for (var s:int; s < obj.objectsArray[3].length; s++)
										{
											if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
											{
												obj.objectsArray[3][s].interact();
											}
										}
									}
									
								}
								else if(obj.matrix[current_robot.i - 1][current_robot.j] == 13)
								{
									for (var s:int; s < obj.objectsArray[5].length; s++)
									{
										if (obj.objectsArray[5][s].i == current_robot.i - 1 && obj.objectsArray[5][s].j == current_robot.j)
										{
											if (obj.objectsArray[5][s].state)
											{
												current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 30; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 10; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i - 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.state = 2;
												current_robot.i--;
												camera_offset_x -= TileSizeX;
												camera_offset_y += TileSizeY;
											}
											break;
										}
									}
									
								}
								break;
								
							case Keyboard.S:
								if (current_robot.aim != 2)
								{
									current_robot.aim = 2;
									current_robot.skeleton.scaleX = -1;
									current_robot.skeleton.skeleton.skinName = "FRONT";
									current_robot.skeleton.skeleton.setSlotsToSetupPose();
									current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
								}
								
								else if (map.matrix[current_robot.i + 1][current_robot.j] == 2)
								{
									if(obj.matrix[current_robot.i + 1][current_robot.j] == 0)
									{
										current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 40; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
											for (var s:int; s < obj.objectsArray[3].length; s++)
											{
												if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
												{
													obj.objectsArray[3][s].interact();
													break;
												}
											}
										}
										else
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 30; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.state = 2;
										current_robot.i++;
										camera_offset_x += TileSizeX;
										camera_offset_y -= TileSizeY;
									}
									else if ((obj.matrix[current_robot.i][current_robot.j] == 1 || obj.matrix[current_robot.i][current_robot.j] == 31 || obj.matrix[current_robot.i][current_robot.j] == 41) && obj.matrix[current_robot.i + 1][current_robot.j] == 5 && obj.matrix[current_robot.i + 2][current_robot.j] == 0 && map.matrix[current_robot.i + 2][current_robot.j] == 2)
									{
										for (k = 0; k < obj.objectsArray[4].length ; k++) 
										{
											if (obj.objectsArray[4][k].i == (current_robot.i + 1) && obj.objectsArray[4][k].j == current_robot.j) 
											{
												obj.objectsArray[4][k].destx = obj.objectsArray[4][k].x - 128;
												obj.objectsArray[4][k].desty = obj.objectsArray[4][k].y + 64;
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 40; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 30; 
												obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
												obj.matrix[current_robot.i + 2][current_robot.j] = 5;
												current_robot.i++;
												obj.objectsArray[4][k].i++;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x += TileSizeX;
												camera_offset_y -= TileSizeY;
											}
											break;
										}
									}
									
									else if (obj.matrix[current_robot.i + 1][current_robot.j] == 14)
									{
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 40; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
										}
										else
										{
											obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 10; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
										current_robot.state = 2;
										current_robot.i++;
										camera_offset_x += TileSizeX;
										camera_offset_y -= TileSizeY;
										for (var s:int; s < obj.objectsArray[3].length; s++)
										{
											if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
											{
												obj.objectsArray[3][s].interact();
											}
										}
									}
								}
								else if(obj.matrix[current_robot.i + 1][current_robot.j] == 13)
								{
									for (var s:int; s < obj.objectsArray[5].length; s++)
									{
										if (obj.objectsArray[5][s].i == current_robot.i + 1 && obj.objectsArray[5][s].j == current_robot.j)
										{
											if (obj.objectsArray[5][s].state)
											{
												current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] + 30; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j] - 10; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i + 1][current_robot.j] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.state = 2;
												current_robot.i++;
												camera_offset_x += TileSizeX;
												camera_offset_y -= TileSizeY;
											}
											break;
										}
									}
									
								}
								break;
							
							case Keyboard.A:
								if (current_robot.aim != 4)
								{
									current_robot.aim = 4;
									current_robot.skeleton.scaleX = 1;
									current_robot.skeleton.skeleton.skinName = "BACK";
									current_robot.skeleton.skeleton.setSlotsToSetupPose();
									current_robot.skeleton.state.setAnimationByName(0, "back_idle", true);
								}
								
								else if (map.matrix[current_robot.i][current_robot.j - 1] == 2)
								{
									if(obj.matrix[current_robot.i][current_robot.j - 1] == 0)
									{
										current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 40; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
											for (var s:int; s < obj.objectsArray[3].length; s++)
											{
												if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
												{
													obj.objectsArray[3][s].interact();
													break;
												}
											}
										}
										else
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 30; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.state = 2;
										current_robot.j--;
										camera_offset_x += TileSizeX;
										camera_offset_y += TileSizeY;
									}
									else if ((obj.matrix[current_robot.i][current_robot.j] == 1 || obj.matrix[current_robot.i][current_robot.j] == 31 || obj.matrix[current_robot.i][current_robot.j] == 41) && obj.matrix[current_robot.i][current_robot.j - 1] == 5 && obj.matrix[current_robot.i][current_robot.j - 2] == 0 && map.matrix[current_robot.i][current_robot.j - 2] == 2)
									{
										for (k = 0; k < obj.objectsArray[4].length ; k++) 
										{
											if (obj.objectsArray[4][k].i == current_robot.i && obj.objectsArray[4][k].j == (current_robot.j - 1)) 
											{
												obj.objectsArray[4][k].destx = obj.objectsArray[4][k].x - 128;
												obj.objectsArray[4][k].desty = obj.objectsArray[4][k].y - 64;
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 40; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 30; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
												obj.matrix[current_robot.i][current_robot.j - 2] = 5;
												current_robot.j--;
												obj.objectsArray[4][k].j--;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x += TileSizeX;
												camera_offset_y += TileSizeY;
											}
											break;
										}
									}
									
									else if (obj.matrix[current_robot.i][current_robot.j - 1] == 14)
									{
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] + 40; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
										}
										else
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] + 10; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
										current_robot.state = 2;
										current_robot.j--;
										camera_offset_x += TileSizeX;
										camera_offset_y += TileSizeY;
										for (var s:int; s < obj.objectsArray[3].length; s++)
										{
											if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
											{
												obj.objectsArray[3][s].interact();
											}
										}
									}
									
								}
								
								else if(obj.matrix[current_robot.i][current_robot.j - 1] == 13)
								{
									for (var s:int; s < obj.objectsArray[5].length; s++)
									{
										if (obj.objectsArray[5][s].i == current_robot.i && obj.objectsArray[5][s].j == current_robot.j - 1)
										{
											if (obj.objectsArray[5][s].state)
											{
												current_robot.skeleton.state.setAnimationByName(0, "back_step", false);
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] + 30; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 10; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
															break;
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.state = 2;
												current_robot.j--;
												camera_offset_x += TileSizeX;
												camera_offset_y += TileSizeY;
											}
											break;
										}
									}
								}
							break;
							
							case Keyboard.D:
								if (current_robot.aim != 6)
								{
									current_robot.aim = 6;
									current_robot.skeleton.scaleX = 1;
									current_robot.skeleton.skeleton.skinName = "FRONT";
									current_robot.skeleton.skeleton.setSlotsToSetupPose();
									current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
								}
								
								else if (map.matrix[current_robot.i][current_robot.j + 1] == 2)
								{
									if(obj.matrix[current_robot.i][current_robot.j + 1] == 0)
									{
										current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] - 40; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
											for (var s:int; s < obj.objectsArray[3].length; s++)
											{
												if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
												{
													obj.objectsArray[3][s].interact();
												}
											}
										}
										else
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] - 30; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										
										current_robot.state = 2;
										current_robot.j++;
										camera_offset_x -= TileSizeX;
										camera_offset_y -= TileSizeY;
									}
									else if ((obj.matrix[current_robot.i][current_robot.j] == 1 || obj.matrix[current_robot.i][current_robot.j] == 31 || obj.matrix[current_robot.i][current_robot.j] == 41) && obj.matrix[current_robot.i][current_robot.j + 1] == 5 && obj.matrix[current_robot.i][current_robot.j + 2] == 0 && map.matrix[current_robot.i][current_robot.j + 2] == 2)
									{
										for (k = 0; k < obj.objectsArray[4].length ; k++) 
										{
											if (obj.objectsArray[4][k].i == current_robot.i && obj.objectsArray[4][k].j == (current_robot.j + 1)) 
											{
												obj.objectsArray[4][k].destx = obj.objectsArray[4][k].x + 128;
												obj.objectsArray[4][k].desty = obj.objectsArray[4][k].y + 64;
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] - 40; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
													for (var s:int; s < obj.objectsArray[3].length; s++)
													{
														if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
														{
															obj.objectsArray[3][s].interact();
														}
													}
												}
												else
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] - 30; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
												obj.matrix[current_robot.i][current_robot.j + 2] = 5;
												current_robot.j++;
												obj.objectsArray[4][k].j++;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x -= TileSizeX;
												camera_offset_y -= TileSizeY;
											}
											break;
										}
									}
									else if (obj.matrix[current_robot.i][current_robot.j + 1] == 14)
									{
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] + 40; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 40)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
										}
										else
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] + 10; 
											obj.matrix[current_robot.i][current_robot.j] = 13;
										}
										current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
										current_robot.state = 2;
										current_robot.j++;
										camera_offset_x -= TileSizeX;
										camera_offset_y -= TileSizeY;
										for (var s:int; s < obj.objectsArray[3].length; s++)
										{
											if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j)
											{
												obj.objectsArray[3][s].interact();
											}
										}
									}
								}
								else if(obj.matrix[current_robot.i][current_robot.j + 1] == 13)
								{
									for (var s:int; s < obj.objectsArray[5].length; s++)
									{
										if (obj.objectsArray[5][s].i == current_robot.i && obj.objectsArray[5][s].j == current_robot.j + 1)
										{
											if (obj.objectsArray[5][s].state)
											{
												current_robot.skeleton.state.setAnimationByName(0, "front_step", false);
												if (obj.matrix[current_robot.i][current_robot.j] < 30)
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] + 30; 
													obj.matrix[current_robot.i][current_robot.j] = 0;
												}
												else if (obj.matrix[current_robot.i][current_robot.j] > 40)
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] - 10; 
													obj.matrix[current_robot.i][current_robot.j] = 14;
												}
												else
												{
													obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
													obj.matrix[current_robot.i][current_robot.j] = 13;
												}
												current_robot.state = 2;
												current_robot.j++;
												camera_offset_x -= TileSizeX;
												camera_offset_y -= TileSizeY;
											}
											break;
										}
									}
								}
								break;
							
							case Keyboard.SPACE:
								 
								switch (current_robot.aim)
								{
									//UP
									case 8:
										switch (obj.matrix[current_robot.i - 1][current_robot.j])
										{
											case 4: //BOTÓN
												for (k = 0; k < obj.objectsArray[3].length ; k++) 
												{
													if (obj.objectsArray[3][k].i == (current_robot.i - 1) && obj.objectsArray[3][k].j == current_robot.j) 
													{
														obj.objectsArray[3][k].interact();
														break;
													}
												}
												break;
											case 10: //REJILLA
												if (obj.matrix[current_robot.i][current_robot.j] == 3)
												{
													for (k = 0; k < obj.objectsArray[7].length ; k++) 
													{
														if (obj.objectsArray[7][k].i == (current_robot.i - 1) && obj.objectsArray[7][k].j == current_robot.j) 
														{
															if (obj.matrix[obj.objectsArray[7][k].target.i][obj.objectsArray[7][k].target.j + 1] == 0)
															{
																var destx:int = TileSizeX * (obj.objectsArray[7][k].target.j + 1 - (obj.objectsArray[7][k].target.i));
																camera_offset_x += current_robot.x - destx;
																var desty:int = -TileSizeY * (obj.objectsArray[7][k].target.j + 1 + (obj.objectsArray[7][k].target.i));
																if (obj.objectsArray[7][k].target.j < 1) desty *= -1;
																camera_offset_y += current_robot.y - desty;
																current_robot.x = destx;
																current_robot.y = desty;
																obj.matrix[obj.objectsArray[7][k].target.i][obj.objectsArray[7][k].target.j + 1] = obj.matrix[current_robot.i][current_robot.j]
																obj.matrix[current_robot.i][current_robot.j] = 0;
																current_robot.i = obj.objectsArray[7][k].target.i;
																current_robot.j = obj.objectsArray[7][k].target.j + 1;
																current_robot.state = 0;
																//Que se gire
																current_robot.aim = 6; current_robot.skeleton.scaleX = 1; current_robot.skeleton.skeleton.skinName = "FRONT"; current_robot.skeleton.skeleton.setSlotsToSetupPose(); current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
															}
															break;
														}
													}
												}
												break;
											default:
												break;
										}
										break;
									
									//DOWN
									case 2:
										switch (obj.matrix[current_robot.i + 1][current_robot.j])
										{
											
											default:
												break;
										}
										break;
									
									//LEFT
									case 4:
										switch (obj.matrix[current_robot.i][current_robot.j - 1])
										{
											case 11:
												if (obj.matrix[current_robot.i][current_robot.j] == 3)
												{
													for (k = 0; k < obj.objectsArray[7].length ; k++) 
													{
														if (obj.objectsArray[7][k].i == (current_robot.i) && obj.objectsArray[7][k].j == current_robot.j - 1) 
														{
															if (obj.matrix[obj.objectsArray[7][k].target.i + 1][obj.objectsArray[7][k].target.j] == 0)
															{
																var dx:int = TileSizeX * (obj.objectsArray[7][k].target.j - (obj.objectsArray[7][k].target.i + 1));
																camera_offset_x += current_robot.x - dx;
																var dy:int = TileSizeY * (obj.objectsArray[7][k].target.j + (obj.objectsArray[7][k].target.i + 1));
																if (obj.objectsArray[7][k].target.j < 1) dy *= -1;
																camera_offset_y += current_robot.y - dy;
																current_robot.x = dx;
																current_robot.y = dy;
																obj.matrix[obj.objectsArray[7][k].target.i + 1][obj.objectsArray[7][k].target.j] = obj.matrix[current_robot.i][current_robot.j]
																obj.matrix[current_robot.i][current_robot.j] = 0;
																current_robot.i = obj.objectsArray[7][k].target.i+1;
																current_robot.j = obj.objectsArray[7][k].target.j;
																current_robot.state = 0;
																current_robot.aim = 2; current_robot.skeleton.scaleX = -1; current_robot.skeleton.skeleton.skinName = "FRONT"; current_robot.skeleton.skeleton.setSlotsToSetupPose(); current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
															}
															break;
														}
													}
												}
												break;
											default:
												break;
										}
										break;
									
									//RIGHT
									case 6:
										switch (obj.matrix[current_robot.i][current_robot.j + 1])
										{
											case 11:
												for (k = 0; k < obj.objectsArray[7].length ; k++) 
												{
													if (obj.objectsArray[7][k].i == (current_robot.i - 1) && obj.objectsArray[7][k].j == current_robot.j) 
													{
														current_robot.i = obj.objectsArray[7][k].target.i;
														current_robot.j = obj.objectsArray[7][k].target.j+1;
														break;
													}
												}
												break;
											default:
												break;
										}
										break;
									default:
										break;
								}

								break;
							
							case Keyboard.Q:
								//animated
								current_robot.state = 4;
								current_robot.robotSpecial();
								break;
								
							default:
								trace("NOPE");
								break;
						}
					}
				}
				else 
				{
					if (event.keyCode == Keyboard.SPACE)
					{
						
						if (hipstom.iteratorI < hipstom.text[hipstom.iteratorJ].length-1)
						{
							hipstom.iteratorI++;
						}
						else 
						{
							hipstom.iteratorI = 0;
							hipstom.iteratorJ++;
						}
						
						if (hipstom.iteratorJ < hipstom.text.length)
						{
							hipstom.messageText.text = hipstom.text[hipstom.iteratorJ][hipstom.iteratorI];
						}
						else
						{
							hipstom.visible = false;
							hipstom.messageText.visible = false;
						}
					}
				}
			}
		}
		
		private function changeCurrentRobot(e:Event):void 
		{
			if (!esc_menu.EscBg.visible && !hipstom.visible) 
			{
				if (current_robot.state == 1)
				{
					var diff_x:uint
					var diff_y:uint
					var buttonClicked:Button = e.target as Button;
					
					if ((buttonClicked as Button) == user_int.normalBtn)
					{
						diff_x = current_robot.x - obj.objectsArray[0][user_int.normalID].x;
						diff_y = current_robot.y - obj.objectsArray[0][user_int.normalID].y;
						current_robot.state = 0;
						current_robot = obj.objectsArray[0][user_int.normalID];
						camera_offset_x += diff_x;
						camera_offset_y += diff_y;
					}
					
					else if ((buttonClicked as Button) == user_int.normalRightBtn)
					{
						user_int.normalID++;
						if (user_int.normalID == obj.objectsArray[0].length) user_int.normalID = 0;
					}
					
					else if ((buttonClicked as Button) == user_int.normalLeftBtn)
					{
						if (user_int.normalID == 0) user_int.normalID = obj.objectsArray[0].length;
						user_int.normalID--;
					}
					
					else if ((buttonClicked as Button) == user_int.miniBtn)
					{
						diff_x = current_robot.x - obj.objectsArray[1][user_int.miniID].x;
						diff_y = current_robot.y - obj.objectsArray[1][user_int.miniID].y;
						current_robot.state = 0;
						current_robot = obj.objectsArray[1][user_int.miniID];
						camera_offset_x += diff_x;
						camera_offset_y += diff_y;
					}
					
					else if ((buttonClicked as Button) == user_int.miniRightBtn)
					{
						user_int.miniID++;
						if (user_int.miniID == obj.objectsArray[1].length) user_int.miniID = 0;
					}
					
					else if ((buttonClicked as Button) == user_int.miniLeftBtn)
					{
						if (user_int.miniID == 0) user_int.miniID = obj.objectsArray[1].length;
						user_int.miniID--;
					}
					
					else if ((buttonClicked as Button) == user_int.nanoBtn)
					{
						diff_x = current_robot.x - obj.objectsArray[2][user_int.nanoID].x;
						diff_y = current_robot.y - obj.objectsArray[2][user_int.nanoID].y;
						current_robot.state = 0;
						current_robot = obj.objectsArray[2][user_int.nanoID];
						camera_offset_x += diff_x;
						camera_offset_y += diff_y;
					}
					
					else if ((buttonClicked as Button) == user_int.nanoRightBtn)
					{
						user_int.nanoID++;
						if (user_int.nanoID == obj.objectsArray[2].length) user_int.nanoID = 0;
					}
					
					else if ((buttonClicked as Button) == user_int.nanoLeftBtn)
					{
						if (user_int.nanoID == 0) user_int.nanoID = obj.objectsArray[2].length - 1;
						user_int.nanoID--;
					}
				}
			}
		}
		
		private function onGameTick(event:Event):void 
		{
			if (!esc_menu.EscBg.visible) 
			{
				obj.sortChildren(entitySort);
				
				checkScripts(); 
				
				switch (current_robot.state)
				{
					case 0:
						//CURRENT ROBOT IDLE ANIMATION
						if (map.x < camera_offset_x) { map.x += 2*SpeedX; obj.x += 2*SpeedX; }

						else if (map.x > camera_offset_x) {map.x -= 2*SpeedX; obj.x -= 2*SpeedX; }
						
						if (map.y < camera_offset_y) {map.y += 2*SpeedY; obj.y += 2*SpeedY; }
						
						else if (map.y > camera_offset_y) { map.y -= 2*SpeedY; obj.y -= 2*SpeedY; }
						
						if (map.x == camera_offset_x && map.y == camera_offset_y) 
						{ 
							if (camera_offset_x == 144 && camera_offset_y == -212) 
							{
								scripts[1] = 1;
							}
							current_robot.state = 1; 
						}
						
						drawScreen();
						
						break;
						
					case 2:
						//MAP MOVEMENT UPDATE
						if (map.x < camera_offset_x) { map.x += SpeedX; obj.x += SpeedX; current_robot.x -= SpeedX; }

						else if (map.x > camera_offset_x) {map.x -= SpeedX; obj.x -= SpeedX; current_robot.x += SpeedX; }
						
						if (map.y < camera_offset_y) {map.y += SpeedY; obj.y += SpeedY; current_robot.y -= SpeedY;}
						
						else if (map.y > camera_offset_y) {map.y -= SpeedY; obj.y -= SpeedY; current_robot.y += SpeedY;}
						
						if (map.x == camera_offset_x && map.y == camera_offset_y) { 
							current_robot.state = 1; 
							if (current_robot.aim == 2 || current_robot.aim == 6) current_robot.skeleton.state.addAnimationByName(0, "front_idle", true, 0); 
							else current_robot.skeleton.state.addAnimationByName(0, "back_idle", true, 0)
						}
						
						drawScreen();
						
						break;
						
					case 3:
						//CURRENT ROBOT INTERACTION
						break;
						
					case 4:
						//CURRENT ROBOT SPECIAL ACTION
						break;
							
				}
			}
		}
		
		private function checkScripts():void 
		{
			for (k = 0; k < scripts.length ; k++) 
			{
				if (scripts[k] == 1) 
				{
					switch (k) 
					{
						case 0:
							camera_offset_x -= TileSizeX * 2;
							camera_offset_y -= TileSizeY * 8;
							current_robot.state = 0;
							scripts[k] = 0;
							break;
							
						case 1:
							camera_offset_x += TileSizeX * 2;
							camera_offset_y += TileSizeY * 8;
							current_robot.state = 0;
							scripts[k] = 0;
							break;
							
						default:
					}
					break;
				}
			}
		}
		
		private function drawScreen():void 
		{
			for each (var tile:MapTile in map.drawArray) 
			{
				if (tile.visible && (400 + 600 < map.x +  tile.x) || (400 - 600 > map.x + tile.x) || (300 + 600 < map.y +  tile.y) || (300 - 600 > map.y + tile.y))
				{
					tile.visible = false;
				}
				else if(!tile.visible && (400 - 600 <= map.x + tile.x <= 400 + 600) && (300 - 600 <= map.y + tile.y <= 300 + 600))
				{
					tile.visible = true;
				}
			}
			for (k = 0; k < obj.objectsArray.length ; k++) 
			{
				for each (var object:Sprite in obj.objectsArray[k]) 
				{
					if (object.visible && (400 + 600 < obj.x +  object.x) || (400 - 600 > obj.x + object.x) || (300 + 600 < obj.y +  object.y) || (300 - 600 > obj.y + object.y))
					{
						object.visible = false;
					}
					else if(!object.visible && (400 - 600 <= obj.x + object.x <= 400 + 600) && (300 - 600 <= obj.y + object.y <= 300 + 600))
					{
						object.visible = true;
					}
				}
			}
		}
		
		private function entitySort(a:Sprite, b:Sprite):int
		{
		if (a.y > b.y)
			return 1;
		else (a.y < b.y)
			return -1;
		}
	}
}