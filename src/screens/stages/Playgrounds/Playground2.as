package screens.stages.Playgrounds 
{

	import flash.media.Sound;
	import flash.media.SoundChannel;
	import objects.Cube;
	import objects.Laser;
	import objects.MapTile;
	import screens.stages.EscMenu;
	import objects.BBot;
	import objects.Hipsbot;
	import objects.MBot;
	import objects.NBot;
	import screens.stages.Hipstom;
	import screens.stages.omaps.ObjectsMap2;
	import screens.stages.lmaps.LevelMap2;
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
	
	public class Playground2 extends Sprite 
	{
		private const TileSizeX:Number = 128;
		private const TileSizeY:Number = 64;
		private const SpeedX:Number = 4;
		private const SpeedY:Number = 2;
		
		private var camera_offset_x:int = -20 * TileSizeX;
		private var camera_offset_y:int = -28 * TileSizeY;
		
		private var map:LevelMap2;
		private var obj:ObjectsMap2;
		private var current_robot:Hipsbot;
		private var user_int:UI;
		private var hipstom:Hipstom;
		private var esc_menu:EscMenu;
		
		private var run:Boolean;
		
		private var musica:Sound;
		
		private var k:int; //iterator
		
		private var scripts:Array = [1, 0, 0, 0, 0, 0, 0, 0, 0];
		
		private var controlable:Boolean = false;
		
		public function Playground2()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			drawGame();
			
			musica = Assets.getMusic("Theme1");
			//musica.play(0, 0);
			//var sc:SoundChannel = new SoundChannel();
			//sc.stop();
			
			/*var i:uint;
			while (current_robot == null)
			{
				current_robot = obj.objectsArray[i][0];
				i++;
			}
			current_robot.state = 1;
			*/
			
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
			this.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.addEventListener(Event.TRIGGERED, changeCurrentRobot);
		}
		
		private function drawGame():void 
		{
			map = new LevelMap2();
			map.x += camera_offset_x;
			map.y += camera_offset_y;
			
			obj = new ObjectsMap2();
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
			
			hipstom.visible = false;
			
			
		}
		
		private function KeyDown(event:KeyboardEvent):void 
		{
			if (event.keyCode == Keyboard.ESCAPE)
			{
				esc_menu.EscBg.visible = true;
				esc_menu.EscBtn.visible = true;
			}
			
			if (controlable) 
			{
				if (!hipstom.visible)
				{
					if (current_robot.state == 1 && map.matrix[current_robot.i][current_robot.j] != 6 )
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
								
								else if (map.matrix[current_robot.i - 1][current_robot.j] == 2 || map.matrix[current_robot.i - 1][current_robot.j] == 6)
								{
									if(obj.matrix[current_robot.i - 1][current_robot.j] == 0)
									{
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "back_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "back_left_step", false); current_robot.rightstep = true; }
										
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
												current_robot.skeleton.state.setAnimationByName(0, "back_push", false);
												obj.matrix[current_robot.i - 2][current_robot.j] = 5;
												current_robot.i--;
												obj.objectsArray[4][k].i --;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x -= TileSizeX;
												camera_offset_y += TileSizeY;
												
												break;
											}
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
										
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "back_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "back_left_step", false); current_robot.rightstep = true; }
										
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
								
								else if (map.matrix[current_robot.i + 1][current_robot.j] == 2 || map.matrix[current_robot.i + 1][current_robot.j] == 6)
								{
									if(obj.matrix[current_robot.i + 1][current_robot.j] == 0)
									{
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "front_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "front_left_step", false); current_robot.rightstep = true; }
										
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
												
												current_robot.skeleton.state.setAnimationByName(0, "front_push", false);
												obj.matrix[current_robot.i + 2][current_robot.j] = 5;
												current_robot.i++;
												obj.objectsArray[4][k].i++;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x += TileSizeX;
												camera_offset_y -= TileSizeY;
												
												break;
											}
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
										
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "front_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "front_left_step", false); current_robot.rightstep = true; }
										
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
								
								else if (map.matrix[current_robot.i][current_robot.j - 1] == 2 || map.matrix[current_robot.i][current_robot.j - 1] == 6)
								{
									if(obj.matrix[current_robot.i][current_robot.j - 1] == 0)
									{
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "back_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "back_left_step", false); current_robot.rightstep = true; }
										
										if (obj.matrix[current_robot.i][current_robot.j] < 30)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else if (obj.matrix[current_robot.i][current_robot.j] > 50)
										{
											obj.matrix[current_robot.i][current_robot.j - 1] = obj.matrix[current_robot.i][current_robot.j] - 50; 
											obj.matrix[current_robot.i][current_robot.j] = 12;
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
												
												current_robot.skeleton.state.setAnimationByName(0, "back_push", false);
												obj.matrix[current_robot.i][current_robot.j - 2] = 5;
												current_robot.j--;
												obj.objectsArray[4][k].j--;
												current_robot.state = 2;
												obj.objectsArray[4][k].state = 1;
												camera_offset_x += TileSizeX;
												camera_offset_y += TileSizeY;
												
												break;
											}
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
										
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "back_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "back_left_step", false); current_robot.rightstep = true; }
										
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
								
								else if (map.matrix[current_robot.i][current_robot.j + 1] == 2 || map.matrix[current_robot.i][current_robot.j + 1] == 6)
								{
									if(obj.matrix[current_robot.i][current_robot.j + 1] == 0)
									{
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "front_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "front_left_step", false); current_robot.rightstep = true; }
										
										if (obj.matrix[current_robot.i][current_robot.j] < 40)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else
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
										
										current_robot.state = 2;
										current_robot.j++;
										camera_offset_x -= TileSizeX;
										camera_offset_y -= TileSizeY;
									}
									
									else if (obj.matrix[current_robot.i][current_robot.j + 1] == 14)
									{
										if (obj.matrix[current_robot.i][current_robot.j] < 40)
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j] + 40; 
											obj.matrix[current_robot.i][current_robot.j] = 0;
										}
										else
										{
											obj.matrix[current_robot.i][current_robot.j + 1] = obj.matrix[current_robot.i][current_robot.j]; 
											obj.matrix[current_robot.i][current_robot.j] = 14;
										}
										
										if (current_robot.rightstep) { current_robot.skeleton.state.setAnimationByName(0, "front_right_step", false); current_robot.rightstep = false; }
										else { current_robot.skeleton.state.setAnimationByName(0, "front_left_step", false); current_robot.rightstep = true; }
										
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
									
									else if (obj.matrix[current_robot.i][current_robot.j] == 1 || obj.matrix[current_robot.i][current_robot.j] == 41)
									{
										if (obj.matrix[current_robot.i][current_robot.j + 1] == 5 || obj.matrix[current_robot.i][current_robot.j + 1] == 45)
										{
											if ((obj.matrix[current_robot.i][current_robot.j + 2] == 0 || obj.matrix[current_robot.i][current_robot.j + 2] == 14) && map.matrix[current_robot.i][current_robot.j + 2] == 2)
											{
												for (k = 0; k < obj.objectsArray[4].length ; k++) 
												{
													if (obj.objectsArray[4][k].i == current_robot.i && obj.objectsArray[4][k].j == (current_robot.j + 1)) 
													{
														obj.objectsArray[4][k].destx = obj.objectsArray[4][k].x + 128;
														obj.objectsArray[4][k].desty = obj.objectsArray[4][k].y + 64;
														
														if (obj.matrix[current_robot.i][current_robot.j] == 41)
														{
															obj.matrix[current_robot.i][current_robot.j + 2] = 5;
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
															obj.matrix[current_robot.i][current_robot.j] = 0;
														}

														if (obj.matrix[current_robot.i][current_robot.j + 1] == 5)
														{
															obj.matrix[current_robot.i][current_robot.j + 1] = 1;
														}
														else
														{
															obj.matrix[current_robot.i][current_robot.j + 1] = 41;
														}
														
														if (obj.matrix[current_robot.i][current_robot.j + 2] == 0)
														{
															obj.matrix[current_robot.i][current_robot.j + 2] = 5;
														}
														else
														{
															obj.matrix[current_robot.i][current_robot.j + 2] = 45;
															for (var s:int; s < obj.objectsArray[3].length; s++)
															{
																if (obj.objectsArray[3][s].i == current_robot.i && obj.objectsArray[3][s].j == current_robot.j + 2)
																{
																	obj.objectsArray[3][s].interact();
																}
															}
														}
														
														current_robot.skeleton.state.setAnimationByName(0, "front_push", false);
														current_robot.j++;
														obj.objectsArray[4][k].j++;
														current_robot.state = 2;
														obj.objectsArray[4][k].state = 1;
														camera_offset_x -= TileSizeX;
														camera_offset_y -= TileSizeY;
														
														break;
													}
												}
											}
										}
									}
								}
								break;
							}
						}
						if (current_robot.state == 1 || current_robot.state == 3)
						{	
							if (event.keyCode == Keyboard.SPACE) 
							{ 
								switch (current_robot.aim)
								{
									//UP
									case 8:
										switch (obj.matrix[current_robot.i - 1][current_robot.j])
										{
											case 4: //BOTÓN
												if (obj.matrix[current_robot.i][current_robot.j] == 2)
												{
													for (k = 0; k < obj.objectsArray[3].length ; k++) 
													{
														if (obj.objectsArray[3][k].i == (current_robot.i - 1) && obj.objectsArray[3][k].j == current_robot.j) 
														{
															obj.objectsArray[3][k].interact();
															break;
														}
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
																var dx:int = TileSizeX * ((obj.objectsArray[7][k].target.j + 1) - obj.objectsArray[7][k].target.i);
																camera_offset_x += current_robot.x - dx;
																var dy:int = TileSizeY * ((obj.objectsArray[7][k].target.j + 1) + obj.objectsArray[7][k].target.i);
																camera_offset_y += current_robot.y - dy;
																current_robot.x = dx;
																current_robot.y = dy;
																obj.matrix[obj.objectsArray[7][k].target.i][obj.objectsArray[7][k].target.j + 1] = obj.matrix[current_robot.i][current_robot.j]
																obj.matrix[current_robot.i][current_robot.j] = 0;
																current_robot.i = obj.objectsArray[7][k].target.i;
																current_robot.j = obj.objectsArray[7][k].target.j+1;
																controlable = false;
																current_robot.aim = 6; 
																current_robot.skeleton.scaleX = 1; 
																current_robot.skeleton.skeleton.skinName = "FRONT"; 
																current_robot.skeleton.skeleton.setSlotsToSetupPose(); 
																current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
															}
															break;
														}
													}
												}
												break;
												
											case 16://generator
												
												if (obj.matrix[current_robot.i][current_robot.j] == 3 || obj.matrix[current_robot.i][current_robot.j] == 16)
												{
													for (k = 0; k < obj.objectsArray[3].length ; k++) 
													{
														if (obj.objectsArray[3][k].i == (current_robot.i - 1) && obj.objectsArray[3][k].j == (current_robot.j - 1)) 
														{
															if (obj.objectsArray[3][k].activated == false)
															{
																obj.matrix[current_robot.i][current_robot.j] = 0;
																obj.matrix[current_robot.i][current_robot.j-1] = 3;
																current_robot.scaleX = 0;
																current_robot.scaleY = 0;
																obj.objectsArray[8][0].ready = true;
																current_robot.j--;
																current_robot.state = 3;
															}
															else //if (obj.matrix[obj.objectsArray[9][k].i+1][obj.objectsArray[9][k].j+1] == 0) 
															{
																current_robot.j++;
																current_robot.scaleX = 1;
																current_robot.scaleY = 1;
																obj.matrix[current_robot.i][current_robot.j] = 3;
																obj.matrix[current_robot.i][current_robot.j - 1] = 16;
																current_robot.state = 2;
															}
															obj.objectsArray[3][k].update();
															
															break;
														}
													}	
												}
												
												/*if (obj.matrix[current_robot.i][current_robot.j] == 3)
												{
													current_robot.scaleX = 0;
													current_robot.scaleY = 0;
													obj.objectsArray[8][0].ready = true;
													scripts[2] = 1;
													
													for (k = 0; k < obj.objectsArray[9].length ; k++) 
													{
														if (obj.objectsArray[9][k].i == (current_robot.i - 1) && obj.objectsArray[9][k].j == (current_robot.j - 1)) 
														{
															obj.matrix[current_robot.i][current_robot.j] = 0;
															current_robot.j--;
															obj.objectsArray[9][k].update();
															current_robot.state = 2;
															break;
														}
													}	
												}
												else if (obj.matrix[current_robot.i][current_robot.j] == 16)
												{
													current_robot.scaleX = 1;
													current_robot.scaleY = 1;
													current_robot.j++;
													obj.matrix[current_robot.i][current_robot.j] = 3;
													for (k = 0; k < obj.objectsArray[9].length ; k++) 
													{
														if (obj.objectsArray[9][k].i == (current_robot.i - 1) && obj.objectsArray[9][k].j == (current_robot.j - 1)) 
														{
															obj.objectsArray[9][k].update();
															break;
														}
													}
													current_robot.state = 2;
												}*/
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
											case 4: //BOTÓN
												for (k = 0; k < obj.objectsArray[3].length ; k++) 
												{
													if (obj.objectsArray[3][k].i == (current_robot.i) && obj.objectsArray[3][k].j == current_robot.j - 1) 
													{
														obj.objectsArray[3][k].interact();
														break;
													}
												}
												break;
											case 11:
												if (obj.matrix[current_robot.i][current_robot.j] == 3)
												{
													for (k = 0; k < obj.objectsArray[7].length ; k++) 
													{
														if (obj.objectsArray[7][k].i == (current_robot.i) && obj.objectsArray[7][k].j == current_robot.j - 1) 
														{
															if (obj.matrix[obj.objectsArray[7][k].target.i][obj.objectsArray[7][k].target.j + 1] == 0)
															{
																controlable = false;
																var dx:int = TileSizeX * ((obj.objectsArray[7][k].target.j + 1) - obj.objectsArray[7][k].target.i);
																var dy:int = TileSizeY * ((obj.objectsArray[7][k].target.j + 1) + obj.objectsArray[7][k].target.i);
																camera_offset_x += (current_robot.x - dx);
																camera_offset_y += (current_robot.y - dy);
																current_robot.x = dx;
																current_robot.y = dy;
																obj.matrix[obj.objectsArray[7][k].target.i][obj.objectsArray[7][k].target.j + 1] = obj.matrix[current_robot.i][current_robot.j]
																obj.matrix[current_robot.i][current_robot.j] = 0;
																current_robot.i = obj.objectsArray[7][k].target.i;
																current_robot.j = obj.objectsArray[7][k].target.j+1;
																current_robot.aim = 6; 
																current_robot.skeleton.scaleX = 1; 
																current_robot.skeleton.skeleton.skinName = "FRONT"; 
																current_robot.skeleton.skeleton.setSlotsToSetupPose(); 
																current_robot.skeleton.state.setAnimationByName(0, "front_idle", true);
																
																obj.objectsArray[7][k].skeleton.state.setAnimationByName(0, "back_interaction", false);
																obj.objectsArray[7][k].skeleton.state.addAnimationByName(0, "idle", false, 0);
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
								
						}
						if (event.keyCode == Keyboard.Q)
						{
							// NANOBOT
							if (obj.matrix[current_robot.i][current_robot.j] == 3 && current_robot.state == 1)
							{
								switch(current_robot.aim)
								{
									//if ((map.matrix[current_robot.i][current_robot.j] == 2 || map.matrix[current_robot.i][current_robot.j] == 6)&& (obj.matrix[current_robot.i][current_robot.j] == 0 || obj.matrix[current_robot.i][current_robot.j] == 14))
									case 8:
										if ((map.matrix[current_robot.i - 1][current_robot.j] == 2 || map.matrix[current_robot.i - 1][current_robot.j] == 6) && (obj.matrix[current_robot.i - 1][current_robot.j] == 0 || obj.matrix[current_robot.i - 1][current_robot.j] == 14))
										{
											if (obj.matrix[current_robot.i][current_robot.j] == 3) obj.matrix[current_robot.i][current_robot.j] = 0;
											else obj.matrix[current_robot.i][current_robot.j] = 14;
											
											current_robot.skeleton.state.setAnimationByName(0, "back_right_step", true);
											
											run = true;
										}
										break;
									case 2:
										if ((map.matrix[current_robot.i + 1][current_robot.j] == 2 || map.matrix[current_robot.i + 1][current_robot.j] == 6) && (obj.matrix[current_robot.i + 1][current_robot.j] == 0 || obj.matrix[current_robot.i + 1][current_robot.j] == 14))
										{
											if (obj.matrix[current_robot.i][current_robot.j] == 3) obj.matrix[current_robot.i][current_robot.j] = 0;
											else obj.matrix[current_robot.i][current_robot.j] = 14;
											
											current_robot.skeleton.state.setAnimationByName(0, "front_right_step", true);
											
											run = true;
										}
										break;
									case 4:
										if ((map.matrix[current_robot.i][current_robot.j - 1] == 2 || map.matrix[current_robot.i][current_robot.j - 1] == 6) && (obj.matrix[current_robot.i][current_robot.j - 1] == 0 || obj.matrix[current_robot.i][current_robot.j - 1] == 14))
										{
											if (obj.matrix[current_robot.i][current_robot.j] == 3) obj.matrix[current_robot.i][current_robot.j] = 0;
											else obj.matrix[current_robot.i][current_robot.j] = 14;
											
											current_robot.skeleton.state.setAnimationByName(0, "back_right_step", true);
											
											run = true;
										}
										break;
									case 6:
										if ((map.matrix[current_robot.i][current_robot.j + 1] == 2 || map.matrix[current_robot.i][current_robot.j + 1] == 6) && (obj.matrix[current_robot.i][current_robot.j + 1] == 0 || obj.matrix[current_robot.i][current_robot.j + 1] == 14))
										{
											if (obj.matrix[current_robot.i][current_robot.j] == 3) obj.matrix[current_robot.i][current_robot.j] = 0;
											else obj.matrix[current_robot.i][current_robot.j] = 14;
											
											current_robot.skeleton.state.setAnimationByName(0, "front_right_step", true);
											
											run = true;
										}
										break;
									default:
										break;
								}
							}
							
							//animated
							//current_robot.state = 4;
							//current_robot.robotSpecial();
						}
					}
				}
				else //HIPSTOM
				{
					if (event.keyCode == Keyboard.SPACE)
					{
						
						/*if (hipstom.iteratorI < hipstom.text[hipstom.iteratorJ].length-1)
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
							controlable = true;
						}*/
						if (hipstom.iteratorI <= hipstom.text[hipstom.iteratorJ].length)
						{
							hipstom.messageText.text = hipstom.text[hipstom.iteratorJ][hipstom.iteratorI];
							hipstom.iteratorI++;
						}
						if (hipstom.iteratorI > hipstom.text[hipstom.iteratorJ].length)
						{
							hipstom.iteratorI = 0;
							hipstom.iteratorJ++;
							hipstom.visible = false;
							hipstom.messageText.visible = false;
							controlable = true;
						}
					}
				}
			}
		}
		
		private function changeCurrentRobot(e:Event):void 
		{
			if (controlable && !hipstom.visible) 
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
						controlable = false;
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
						controlable = false;
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
						controlable = false;
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
			//if (!musica.isBuffering) musica.play(0, 0);
			
			if (!esc_menu.EscBg.visible) 
			{
				obj.sortChildren(entitySort);
				drawScreen();
				
				
				// ----- SCRIPTS -----
				
				/*if (obj.objectsArray[3][3].state == true && map.drawArray[82].y != map.drawArray[82].desty) scripts[4] = 1;
				
				if (obj.objectsArray[3][0].state == true)
				{
					obj.objectsArray[8][0].ready = true;
					obj.objectsArray[3][0].state = false;
					scripts[5] = 1;
				}*/
				
				//PLATFORMS_2
				if (obj.objectsArray[3][0].activated == true && map.drawArray[114].y != map.drawArray[113].desty) scripts[10] = 1;
				
				//PLATFORMS_1
				if (obj.objectsArray[3][3].state && !obj.objectsArray[3][3].last_state)
				{
					obj.objectsArray[3][3].last_state = true;
					scripts[8] = 1;
				}
				else if (!obj.objectsArray[3][3].state && obj.objectsArray[3][3].last_state)
				{
					obj.objectsArray[3][3].last_state = false;
					scripts[9] = 1;
				}
				
				// MAGNETIC FLOOR_1
				if (obj.objectsArray[3][1].state == false)
				{
					for (k = 0; k < obj.objectsArray[3][1].targets.length ; k++) 
					{
						map.matrix[obj.objectsArray[3][1].targets[k].i][obj.objectsArray[3][1].targets[k].j] = 6;
					}
				}
				else
				{
					for (k = 0; k < obj.objectsArray[3][1].targets.length ; k++) 
					{
						map.matrix[obj.objectsArray[3][1].targets[k].i][obj.objectsArray[3][1].targets[k].j] = 2;
					}
				}
				
				// MAGNETIC FLOOR_2
				if (obj.objectsArray[3][2].state == false)
				{
					for (k = 0; k < obj.objectsArray[3][2].targets.length ; k++) 
					{
						map.matrix[obj.objectsArray[3][2].targets[k].i][obj.objectsArray[3][2].targets[k].j] = 6;
					}
				}
				else
				{
					for (k = 0; k < obj.objectsArray[3][2].targets.length ; k++) 
					{
						map.matrix[obj.objectsArray[3][2].targets[k].i][obj.objectsArray[3][2].targets[k].j] = 2;
					}
				}
				
				// LASERS
				
				
				checkScripts();
				
				
				// ----- RUN ----- //
				
				if (run)
				{
					switch(current_robot.aim)
						{
							//if ((map.matrix[current_robot.i][current_robot.j] == 2 || map.matrix[current_robot.i][current_robot.j] == 6)&& (obj.matrix[current_robot.i][current_robot.j] == 0 || obj.matrix[current_robot.i][current_robot.j] == 14))
							case 8:
								if ((map.matrix[current_robot.i - 1][current_robot.j] == 2 || map.matrix[current_robot.i - 1][current_robot.j] == 6) && (obj.matrix[current_robot.i - 1][current_robot.j] == 0 || obj.matrix[current_robot.i - 1][current_robot.j] == 14))
								{
									//current_robot.skeleton.state.setAnimationByName(0, "back_right_step", true);
									
									current_robot.state = 4;
									current_robot.i--;
									camera_offset_x -= TileSizeX;
									camera_offset_y += TileSizeY;
								}
								else
								{
									if (obj.matrix[current_robot.i][current_robot.j] == 0) obj.matrix[current_robot.i][current_robot.j] = 3;
									else obj.matrix[current_robot.i][current_robot.j] = 43;
									
									current_robot.skeleton.state.addAnimationByName(0, "back_idle", true, 0);
									
									run = false;
									current_robot.state = 1;
								}
								break;
								
							case 2:
								if ((map.matrix[current_robot.i + 1][current_robot.j] == 2 || map.matrix[current_robot.i + 1][current_robot.j] == 6)&& (obj.matrix[current_robot.i + 1][current_robot.j] == 0 || obj.matrix[current_robot.i + 1][current_robot.j] == 14))
								{
									//current_robot.skeleton.state.setAnimationByName(0, "front_left_step", true);
									
									current_robot.state = 4;
									current_robot.i++;
									camera_offset_x += TileSizeX;
									camera_offset_y -= TileSizeY;
								}
								else
								{
									if (obj.matrix[current_robot.i][current_robot.j] == 0) obj.matrix[current_robot.i][current_robot.j] = 3;
									else obj.matrix[current_robot.i][current_robot.j] = 43;
									
									current_robot.skeleton.state.addAnimationByName(0, "front_idle", true, 0);
									
									run = false;
									current_robot.state = 1;
								}
								break;
								
							case 4:
								if ((map.matrix[current_robot.i][current_robot.j - 1] == 2 || map.matrix[current_robot.i][current_robot.j - 1] == 6) && (obj.matrix[current_robot.i][current_robot.j - 1] == 0 || obj.matrix[current_robot.i][current_robot.j - 1] == 14))
								{
									//current_robot.skeleton.state.setAnimationByName(0, "back_right_step", true);
									
									current_robot.state = 4;
									current_robot.j--;
									camera_offset_x += TileSizeX;
									camera_offset_y += TileSizeY;
								}
								else
								{
									if (obj.matrix[current_robot.i][current_robot.j] == 0) obj.matrix[current_robot.i][current_robot.j] = 3;
									else obj.matrix[current_robot.i][current_robot.j] = 43;
									
									current_robot.skeleton.state.addAnimationByName(0, "back_idle", true, 0);
									
									run = false;
									current_robot.state = 1;
								}
								break;
								
							case 6:
								if ((map.matrix[current_robot.i][current_robot.j + 1] == 2 || map.matrix[current_robot.i][current_robot.j + 1] == 6)&& (obj.matrix[current_robot.i][current_robot.j + 1] == 0 || obj.matrix[current_robot.i][current_robot.j + 1] == 14))
								{
									//current_robot.skeleton.state.setAnimationByName(0, "front_right_step", true);
									
									current_robot.state = 4;
									current_robot.j++;
									camera_offset_x -= TileSizeX;
									camera_offset_y -= TileSizeY;
								}
								else
								{
									if (obj.matrix[current_robot.i][current_robot.j] == 0) obj.matrix[current_robot.i][current_robot.j] = 3;
									else obj.matrix[current_robot.i][current_robot.j] = 43;
									
									current_robot.skeleton.state.addAnimationByName(0, "front_idle", true, 0);
									
									run = false;
									current_robot.state = 1;
								}
								break;
							default:
								break;
						}
				}
				
				
				// ----- MOVEMENT ----- //
				
				switch (controlable)
				{
					case false:
						//CURRENT ROBOT IDLE ANIMATION
						if (map.x < camera_offset_x) { map.x += 2*SpeedX; obj.x += 2*SpeedX; }

						else if (map.x > camera_offset_x) {map.x -= 2*SpeedX; obj.x -= 2*SpeedX; }
						
						if (map.y < camera_offset_y) {map.y += 2*SpeedY; obj.y += 2*SpeedY; }
						
						else if (map.y > camera_offset_y) { map.y -= 2*SpeedY; obj.y -= 2*SpeedY; }
						
						if (map.x == camera_offset_x && map.y == camera_offset_y) 
						{ 
							controlable = true;
							
							if (camera_offset_x == 3 * TileSizeX && camera_offset_y == -5 * TileSizeY) 
							{
								scripts[1] = 1;
							}
							else if (camera_offset_x == 10 * TileSizeX && camera_offset_y == -12 * TileSizeY) 
							{
								scripts[2] = 1;
							}
							else if (camera_offset_x == 0 * TileSizeX && camera_offset_y == -22 * TileSizeY && obj.objectsArray[8][0].ready) 
							{
								scripts[3] = 1;
							}
							else if (camera_offset_x == 7 * TileSizeX && camera_offset_y == -29 * TileSizeY && obj.objectsArray[8][0].ready) 
							{
								scripts[4] = 1;
							}
							else if (camera_offset_x == 16 * TileSizeX && camera_offset_y == -20 * TileSizeY && obj.objectsArray[8][0].ready) 
							{
								scripts[5] = 1;
							}
							else if (camera_offset_x == 22 * TileSizeX && camera_offset_y == -26 * TileSizeY && obj.objectsArray[8][0].ready) 
							{
								scripts[6] = 1;
							}
							else if (camera_offset_x == 13 * TileSizeX && camera_offset_y == -35 * TileSizeY && obj.objectsArray[8][0].ready) 
							{
								scripts[7] = 1;
							}
						}
						
						break;
						
  					case true:
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
						
						break;
						
					case 3:
						//CURRENT ROBOT INTERACTION
						break;
						
					case 4:
						if (map.x < camera_offset_x) { map.x += 6*SpeedX; obj.x += 6*SpeedX; }

						else if (map.x > camera_offset_x) {map.x -= 6*SpeedX; obj.x -= 6*SpeedX; }
						
						if (map.y < camera_offset_y) {map.y += 6*SpeedY; obj.y += 6*SpeedY; }
						
						else if (map.y > camera_offset_y) { map.y -= 6*SpeedY; obj.y -= 6*SpeedY; }
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
							camera_offset_x = 3 * TileSizeX;
							camera_offset_y = -5 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 1:
							camera_offset_x = 10 * TileSizeX;
							camera_offset_y = -12 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 2:
							camera_offset_x = 0 * TileSizeX;
							camera_offset_y = -22 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 3:
							camera_offset_x = 7 * TileSizeX;
							camera_offset_y = -29 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 4:
							camera_offset_x = 16 * TileSizeX;
							camera_offset_y = -20 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 5:
							camera_offset_x = 22 * TileSizeX;
							camera_offset_y = -26 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 6:
							camera_offset_x = 13 * TileSizeX;
							camera_offset_y = -35 * TileSizeY;
							controlable = false;
							scripts[k] = 0;
							break;
							
						case 7:
							obj.matrix[26][16] = 50 + obj.objectsArray[8][0].type;
							obj.objectsArray[8][0].ready = false;
							var Bot:Hipsbot;
							switch (obj.objectsArray[8][0].type) 
							{
								case 1:
									Bot = new BBot(obj.objectsArray[8][0].i,obj.objectsArray[8][0].j);
									Bot.x = obj.objectsArray[8][0].x;
									Bot.y = obj.objectsArray[8][0].y;
									obj.objectsArray[0].push(Bot);
									break;
									
								case 2:
									Bot = new MBot(obj.objectsArray[8][0].i,obj.objectsArray[8][0].j);
									Bot.x = obj.objectsArray[8][0].x;
									Bot.y = obj.objectsArray[8][0].y;
									obj.objectsArray[1].push(Bot);
									obj.objectsArray[8][0].type = 1;
									break;
									
								case 3:
									Bot = new NBot(obj.objectsArray[8][0].i,obj.objectsArray[8][0].j);
									Bot.x = obj.objectsArray[8][0].x;
									Bot.y = obj.objectsArray[8][0].y;
									obj.objectsArray[2].push(Bot);
									obj.objectsArray[8][0].type = 2;
									break;
							}
							current_robot = Bot;
							obj.addChild(Bot);
							controlable = true;
							hipstom.visible = true;
							hipstom.messageText.visible = true;
							hipstom.messageText.text = hipstom.text[hipstom.iteratorJ][hipstom.iteratorI];
							hipstom.iteratorI++;
							scripts[k] = 0;
							break;
							
						case 8:
							map.drawArray[162].activated = true;
							map.drawArray[163].activated = true;
							map.drawArray[164].activated = true;
							map.drawArray[165].activated = true;
							map.drawArray[175].activated = true;
							map.drawArray[176].activated = true;
							map.drawArray[177].activated = true;
							map.drawArray[178].activated = true;
							if (map.drawArray[162].y == map.drawArray[162].desty) map.matrix[18][11] = 2;
							if (map.drawArray[163].y == map.drawArray[163].desty) map.matrix[18][12] = 2;
							if (map.drawArray[164].y == map.drawArray[164].desty) map.matrix[18][13] = 2;
							if (map.drawArray[165].y == map.drawArray[165].desty) map.matrix[18][14] = 2;
							if (map.drawArray[175].y == map.drawArray[175].desty) map.matrix[19][11] = 2;
							if (map.drawArray[176].y == map.drawArray[176].desty) map.matrix[19][12] = 2;
							if (map.drawArray[177].y == map.drawArray[177].desty) map.matrix[19][13] = 2;
							if (map.drawArray[178].y == map.drawArray[178].desty) map.matrix[19][14] = 2;
							if ((map.drawArray[162].y == map.drawArray[162].desty) && (map.drawArray[163].y == map.drawArray[163].desty) && (map.drawArray[164].y == map.drawArray[164].desty) && (map.drawArray[165].y == map.drawArray[165].desty) && (map.drawArray[175].y == map.drawArray[175].desty) && (map.drawArray[176].y == map.drawArray[176].desty) && (map.drawArray[177].y == map.drawArray[177].desty) && (map.drawArray[178].y == map.drawArray[178].desty)) 
							{
								scripts[8] = 0;
							}
							break;
							
						case 9:
							map.drawArray[162].activated = false; map.matrix[18][11] = 0;
							map.drawArray[163].activated = false; map.matrix[18][12] = 0;
							map.drawArray[164].activated = false; map.matrix[18][13] = 0;
							map.drawArray[165].activated = false; map.matrix[18][14] = 0;
							map.drawArray[175].activated = false; map.matrix[19][11] = 0;
							map.drawArray[176].activated = false; map.matrix[19][12] = 0;
							map.drawArray[177].activated = false; map.matrix[19][13] = 0;
							map.drawArray[178].activated = false; map.matrix[19][14] = 0;
							scripts[9] = 0;
							break;
							
						case 10:
							
							map.drawArray[114].activated = true;
							map.drawArray[115].activated = true;
							map.drawArray[116].activated = true;
							map.drawArray[117].activated = true;
							map.drawArray[131].activated = true;
							map.drawArray[132].activated = true;
							map.drawArray[133].activated = true;
							map.drawArray[134].activated = true;
							if (map.drawArray[114].y == map.drawArray[114].desty) map.matrix[12][11] = 2;
							if (map.drawArray[115].y == map.drawArray[115].desty) map.matrix[12][12] = 2;
							if (map.drawArray[116].y == map.drawArray[116].desty) map.matrix[12][13] = 2;
							if (map.drawArray[117].y == map.drawArray[117].desty) map.matrix[12][14] = 2;
							if (map.drawArray[131].y == map.drawArray[131].desty) map.matrix[13][11] = 2;
							if (map.drawArray[132].y == map.drawArray[132].desty) map.matrix[13][12] = 2;
							if (map.drawArray[133].y == map.drawArray[133].desty) map.matrix[13][13] = 2;
							if (map.drawArray[134].y == map.drawArray[134].desty) map.matrix[13][14] = 2;
							if ((map.drawArray[114].y == map.drawArray[114].desty) && (map.drawArray[115].y == map.drawArray[115].desty) && (map.drawArray[116].y == map.drawArray[116].desty) && (map.drawArray[117].y == map.drawArray[117].desty) && (map.drawArray[131].y == map.drawArray[131].desty) && (map.drawArray[132].y == map.drawArray[132].desty) && (map.drawArray[133].y == map.drawArray[133].desty) && (map.drawArray[134].y == map.drawArray[134].desty))
							{
								scripts[10] = 0;
							}
							break;
							
						default:
							break;
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