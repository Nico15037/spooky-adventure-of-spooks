extends KinematicBody

export var speed = 3;
export var jump_power = 20;
export var gravity = 75;

var velocity = Vector3.ZERO;

#var conga_followers = 10;
#var conga_sep = 2;
#var conga_line = [];
#conga_line[conga_sep*conga_followers+2] = 0;
#var conga_max = conga_sep*conga_followers+2;

#func conga_step(_xpos, _ypos):
#	conga_line.push_front(_ypos);
#	conga_line.push_front(_xpos);
#
#	if (conga_line.size() > conga_max):
#		conga_line.pop_back();
#		conga_line.pop_back();
#
#	print_debug(conga_line.size(),conga_line)

func _physics_process(delta):
	var dir = Vector3.ZERO;
	if Input.is_action_pressed("move_right"):
		dir.x += 5;
	if Input.is_action_pressed("move_left"):
		dir.x -= 1;
	if Input.is_action_pressed("move_back"):
		dir.z += 1;
	if Input.is_action_pressed("move_forward"):
		dir.z -= 1;
	
	if dir != Vector3.ZERO:
		dir = dir.normalized();
	
	velocity.x = dir.x * speed;
	velocity.z = dir.z * speed;
	
	#conga_step(dir.x, dir.y);
	
	move_and_slide(velocity, Vector3.UP);
	
	
