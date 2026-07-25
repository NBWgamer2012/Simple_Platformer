extends TouchScreenButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shared.interaction == true:
		position.y = 9969
	else:
		position.y = 0
