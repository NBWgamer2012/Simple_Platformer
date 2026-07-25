extends AudioStreamPlayer
var music_loaded :bool = false
var bgcontinue :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	while true:	
		if str(get_tree().current_scene.name) == "Main":
			music_loaded = true
			if len(shared.cur_stage_start_positions[int(shared.level_number)]) > 3:
				if OS.has_feature("pc"):
					if FileAccess.file_exists("res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.level_number)][3])):
						self.stream = AudioStreamOggVorbis.load_from_file(str(("res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.level_number)][3]))))
						music_text_show(str(shared.cur_stage_start_positions[int(shared.level_number)][3]))
					else:
						shared.error.append(str("could not load audio track at", "res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.level_number)][3])))
				else:
					if ResourceLoader.exists(str(("res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.level_number)][3])))):
						self.stream = load(str(("res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.level_number)][3]))))		
						music_text_show(str(shared.cur_stage_start_positions[int(shared.level_number)][3]))
					else:
						shared.error.append(str("could not load audio track " + str(shared.cur_stage_start_positions[int(shared.level_number)][3])))
			else:
				shared.error.append(str("could not get music from array, check if item 3 exists"))
				
		
			play()
			while bgcontinue == false:
				await get_tree().scene_changed
				if get_tree().current_scene.name == "Main":
					bgcontinue = false
				else:
					bgcontinue = true
				
			bgcontinue = false


			stop()
		await get_tree().create_timer(0.01).timeout
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
# str("res://assets/Audio/tracks/" + str(shared.cur_stage_start_positions[int(shared.cur_stage)][3]))



func music_text_show(current_music):
	shared.current_music_text = ""
	
	for i in len(audioinfo.Music_INFO):
		if str(current_music) == str(audioinfo.Music_INFO[i][0]):
			shared.current_music_text = str(audioinfo.Music_INFO[i][0] + " by " + audioinfo.Music_INFO[i][1])
	print(audioinfo.Music_INFO, shared.current_music_text)
	if shared.current_music_text == "":
		shared.current_music_text = "Unable to load song info"
	
	
