extends Button


# Called when the node enters the scene tree for the first time.
var map_found :bool = false
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if button_pressed:
		shared.cur_stage = name
		print("loading level", name)
		for i in len(shared.cur_stage_start_positions):
			if shared.cur_stage == shared.cur_stage_start_positions[i][0]:
				shared.cur_checkpoint = Vector2i(shared.cur_stage_start_positions[i][1], shared.cur_stage_start_positions[i][2])
				map_found = true
				shared.level_number = i
		if map_found == false:
			print('failed to find LVL pointers, resetting...')
			get_tree().change_scene_to_file("res://tscn/reset.tscn")
		get_tree().change_scene_to_file("res://tscn/main.tscn")
	text = name
