extends StaticBody

onready var txt = get_node("../../../textbox/Label");
onready var player = get_node("../../../the spooks space");

func _physics_process(_w):
	print(get_node("../../../the spooks space").name)

func _on_Area_area_entered(area):
	txt.text = "1";
	player.can_move = false;
