extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -66


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = shared.px
