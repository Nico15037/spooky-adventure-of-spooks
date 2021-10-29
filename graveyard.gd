extends Spatial

onready var txt = get_node("../../../textbox/Label");
onready var player = get_node("../../../the spooks space");

var in_range = false;
var interact_range = 5;
#func _physics_process(_w):
#	print(get_node("../../../the spooks space").name)

#onready var grave_type = get_node()

func _on_Area_area_entered(area):
	in_range = true;

func _on_Area_area_exited(area):
	in_range = false;
	
func _process(delta):
	print(self.name)
	if (Input.is_action_pressed("ui_accept")) && (in_range):
		
		txt.text = "1";
		

func interact():
	var new_dialog = Dialogic.start("tm_treesane");
	add_child(new_dialog);
