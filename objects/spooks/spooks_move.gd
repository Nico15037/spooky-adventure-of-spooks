extends KinematicBody

export var speed = 13;
export var jump_power = 20;
export var gravity = 75;

signal bugle;
signal bagule;

var nearest_object = [];
var in_range = false;
var can_move = true;
var stop_text_loop = false;
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

func _process(delta):
	if (can_move == false):
		if (stop_text_loop == true):
			can_move = true;
			stop_text_loop = false;
		return;

	var objects = get_tree().get_nodes_in_group("interact");
	nearest_object = objects[0];
	var pos = global_transform.origin;
	var nearest_object_pos = nearest_object.global_transform.origin;

	for object in objects:
		if object.global_transform.origin.distance_to(pos) < nearest_object.global_transform.origin.distance_to(pos):
			nearest_object = object;
			nearest_object_pos = nearest_object.global_transform.origin;
	var interact_range = nearest_object.interact_range;
	if nearest_object_pos.distance_to(pos) <= interact_range:
		in_range = true;
	else:
		in_range = false;

	if Input.is_action_just_pressed("ui_accept") && (in_range == true):
		if nearest_object.has_method("interact"):
			nearest_object.interact();

func allow_move():
	stop_text_loop = true;
