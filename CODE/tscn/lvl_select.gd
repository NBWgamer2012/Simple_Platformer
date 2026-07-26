extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	var childcount = get_child_count()
	for i in childcount:
		get_child(i).position.y = 31*(i+1)
		get_child(i).position.x = -38

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
