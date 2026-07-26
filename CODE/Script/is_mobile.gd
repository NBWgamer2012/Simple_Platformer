extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = 10000
	if  OS.has_feature("pc"):
		position.y = -10000
# Called every frame. 'delta' is the elapsed time since the previous frame.s
@warning_ignore("unused_parameter")
func _process(delta):
	pass
