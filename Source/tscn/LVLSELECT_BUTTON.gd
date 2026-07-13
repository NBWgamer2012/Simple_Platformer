extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		shared.cur_stage = name
		get_tree().change_scene_to_file("res://tscn/main.tscn")
	text = name
