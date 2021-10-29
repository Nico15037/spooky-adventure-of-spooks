extends Spatial

onready var txt = get_node("../../../textbox/Label");
onready var player = get_node("../../../the spooks space");
var in_range = false;

#func _physics_process(_w):
#	print(get_node("../../../the spooks space").name)

func _on_Area_area_entered(area):
	in_range = true;

func _on_Area_area_exited(area):
	in_range = false;
	
func _process(delta):
	if (Input.is_action_pressed("ui_accept")) && (in_range):
		player.can_move = false;
		txt.text = "1";
