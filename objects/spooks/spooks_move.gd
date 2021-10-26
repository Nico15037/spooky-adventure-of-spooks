extends KinematicBody

export var speed = 3;
export var jump_power = 20;
export var gravity = 75;

var velocity = Vector3.ZERO;

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
	
	move_and_slide(velocity, Vector3.UP);
