extends StaticBody

onready var txt = get_node("../../../textbox/Label");
onready var player = get_node("../../../the spooks space");

func _on_Area_area_entered(area):
	txt.text = "1";
	player.can_move = false;
