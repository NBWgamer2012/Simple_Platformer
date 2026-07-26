extends TouchScreenButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_tree().paused = !get_tree().paused
	if shared.ispaused == false:
		shared.ispaused = true
	else:
		shared.ispaused = false
