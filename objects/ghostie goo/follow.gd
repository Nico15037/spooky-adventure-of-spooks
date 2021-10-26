extends KinematicBody

var path = [];
var path_node = 0;

var speed = 10;

onready var player = $"../../../../the spooks space";
onready var nav = $"../../.."; #SPOOKS STALKERS

func _ready():
	print_debug(player.name)

func _physics_process(delta):
	#print_debug(path_node < path.size(),path_node,path)
	if (path_node < path.size()):
		var dir = (path[path_node] - global_transform.origin);
		
		if (dir.length() < 1):
			path_node += 1;
		else:
			move_and_slide(dir.normalized() * speed, Vector3.UP);

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos);
	print_debug(path)
	path_node = 0;

func _on_Timer_timeout():
	move_to(player.global_transform.origin);
	print_debug("KK")
