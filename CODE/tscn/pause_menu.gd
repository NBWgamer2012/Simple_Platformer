extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shared.ispaused == true:
		position.y = 0
	else:
		position.y = 100000


func _on_exit_pressed():
	get_tree().paused = false
	shared.ispaused = false
	get_tree().change_scene_to_file("res://tscn/main_menu.tscn")
