/// @desc Player character logic

//inputs
key_left = (keyboard_check(vk_left) or keyboard_check(ord("A")));
key_right = (keyboard_check(vk_right) or keyboard_check(ord("D")));
key_jump = (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")));
key_phase = keyboard_check_pressed(vk_space);

//Shifting
if (key_phase){
	if (global.phase == 0){
		global.phase = 1;
	}
	else{
		global.phase = 0;
	}
}

//movement
var move = key_right - key_left;

phy_speed_x = move * walk_speed;

if (key_jump){
	for (var i = 23; i < 41; i++){
		if (!position_empty(x+i, y+66)){
			on_ground = true;
		}
	}
	if (on_ground){
		physics_apply_impulse(x, y, 0, jump_force);
	}
	on_ground = false;
}

//collision

/*
if (position_meeting(x, y+63, all)){
	PlayerObject.friction = 0;
} else {
	friction = 0.2;
}

if (place_meeting(x, y+vspeed, WallObject)){
	while (!place_meeting(x, y+sign(vspeed), WallObject)){
		y += sign(vspeed);
	}
	vspeed = 0;
}
*/