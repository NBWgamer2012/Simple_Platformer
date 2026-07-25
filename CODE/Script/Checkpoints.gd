extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _BODY_ENTERED(body):
	if body is Player:
		shared.cur_checkpoint = position
