extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().direction == 1:
		position.x = 8
	elif get_parent().direction == -1:
		position.x = -8
