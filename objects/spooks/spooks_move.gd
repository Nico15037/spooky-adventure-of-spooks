extends KinematicBody

export var speed = 3;
export var jump_power = 20;
export var gravity = 75;

signal bugle;
signal bagule;

var can_move = true;
var velocity = Vector3.ZERO;

func _physics_process(delta):
	if (can_move == false):
		return;
	
	var dir = Vector3.ZERO;
	if Input.is_action_pressed("move_right"):
		dir.x += 1;
		emit_signal("bugle");
	if Input.is_action_pressed("move_left"):
		dir.x -= 1;
		emit_signal("bugle");
	if Input.is_action_pressed("move_back"):
		dir.z += 1;
		emit_signal("bugle");
	if Input.is_action_pressed("move_forward"):
		dir.z -= 1;
		emit_signal("bugle");
#	if Input.is_action_just_pressed("move_forward") || Input.is_action_just_pressed("move_down") || Input.is_action_just_pressed("move_left") || Input.is_action_just_pressed("move_right"):
#		emit_signal("bugle");
#
#	if Input.is_action_just_released("move_forward") || Input.is_action_just_released("move_down") || Input.is_action_just_released("move_left") || Input.is_action_just_released("move_right"):
#		emit_signal("bagule");
	
	if dir != Vector3.ZERO:
		dir = dir.normalized();
	
	
	velocity.x = dir.x * speed;
	velocity.z = dir.z * speed;
	
	move_and_slide(velocity, Vector3.UP);
		
