extends Node

var text = []
var character = []
var code = []

var text_num = 0
var text_max = 64
var text_pos = 0
var text_box
var text_node
var text_speed = 1.0 / 2

func _ready():
	text_box = $textbox;
	text_node = get_node("textbox/Label");
	text_node.visible_characters = 0;
	text.resize(10);

func add_text(input_text, input_character, input_code):
	var a
	
	a = 0
	while a < text.size():
		if text[a] == "":
			text[a] = input_text
			#character[a] = input_character
			#code[a] = input_code
			break
		else:
			a += 1


func _process(delta):
	if text[0] != "":
		text_box.modulate.a = 1;
		text_node.visible_characters = text_pos
		if text_node.visible_characters < text[text_num].length():
			text_pos += text_speed
			if Input.is_action_just_pressed("ui_accept"):
				text_pos = text[text_num].length()
		else:
			if Input.is_action_just_pressed("ui_accept"):
				text_num += 1
				text_pos = 0
				if text[text_num] == "":
					for a in text_max:
						text[a] = ""
						character[a] = ""
						code[a] = ""
					text_num = 0
