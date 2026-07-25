extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2i(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shared.menupage == 1:
		position = Vector2i(0, 0)
	elif shared.menupage == 2:
		position = Vector2i (666, 0)
	elif shared.menupage == 0:
		position = Vector2i(-666, 0)
