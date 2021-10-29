extends KinematicBody

export var speed = 3;
export var jump_power = 20;
export var gravity = 75;

signal bugle;
signal bagule;

var nearest_object = [];
var interact_range = 5;

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
		

func allow_move():
	can_move = true;

#func _process(delta):
#	if (can_move == false):
#		return;
#
#	var objects = get_tree().get_nodes_in_group("interact");
#	nearest_object = objects[0];
#	var pos = global_transform.origin;
#	var nearest_object_pos = nearest_object.global_transform.origin;
#
#	for object in objects:
#		if object.global_transform.origin.distance_to(pos) < nearest_object.global_transform.origin.distance_to(pos):
#			nearest_object = object;
#			nearest_object_pos = nearest_object.global_transform.origin;
#	var interact_range = nearest_object.interact_range;
#	if nearest_object_pos.distance_to(pos) <= interact_range:
#		nearest_object.get_node("interact_icon").in_range = true
#
#	var interact_icon = nearest_object.get_node("interact_icon")
#	if Input.is_action_just_pressed("ui_accept"):
#		if interact_icon.visible:
#			if nearest_object.has_method("interact"):
#				if interact_icon.mimi_facing_me:
#					nearest_object.interact()
