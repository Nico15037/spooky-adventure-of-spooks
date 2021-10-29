extends Spatial

onready var player = get_node("../../../../the spooks space");

var interact_range = 2;

func interact():
	player.can_move = false;
	var new_dialog = Dialogic.start(self.name);
	add_child(new_dialog);
