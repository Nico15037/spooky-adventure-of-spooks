extends StaticBody

onready var txt = get_node("../../../textbox/Label");
onready var player = get_node("../../../the spooks space");

func _on_Area_area_entered(area):
	player.can_move = false;
	var new_dialog = Dialogic.start("tm_treesane");
	add_child(new_dialog);
