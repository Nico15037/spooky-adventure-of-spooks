extends KinematicBody

var path = [];
var path_node = 0;

var speed = 3;

onready var player = $"../../../../the spooks space";
onready var nav = $"../../.."; #SPOOKS STALKERS

func _ready():
	player.connect("bugle",self,"move_to"); #attach movement signal
	player.connect("bagule",self,"no"); #attach movement signal
	path = nav.get_simple_path(global_transform.origin, player.global_transform.origin);

func _physics_process(delta):
	
	if (path_node < path.size()):
		var dir = (path[path_node] - global_transform.origin);
		
		if (dir.length() < 1):
			path_node += 1;
		else:
			if (path_node > 1):
				speed = lerp(speed,1,0.1);
			else: #ngl these lerps do literally nothing
				speed = lerp(speed,3,0.1);
			move_and_slide(dir.normalized() * speed, Vector3.UP);
			#print(path_node,path.size())

func move_to():
#	path = nav.get_simple_path(global_transform.origin, player.global_transform.origin);
#	path_node = 0;
#	$Timer.start(0.1);
#	$Timer.set_autostart(true);
#	print("bro")
	
	path.append_array(nav.get_simple_path(path[-1], player.global_transform.origin)); #nav.get_simple_path(global_transform.origin, player.global_transform.origin); 
	if (path.size() > 1):
		path.invert();
		path.resize(1);
		path.invert();
		path_node = 0;
	

func no():
	$Timer.set_autostart(false);

func _on_Timer_timeout():
	path = nav.get_simple_path(global_transform.origin, player.global_transform.origin);
	path_node = 0;
