extends Node
@onready var checkpoints = $".."
var checknumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	checknumber = int(name) + 1
	print(checknumber)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _BODY_ENTERED(body):
	if body is Player:
		if not shared.cur_checkpoint >= checknumber:
			shared.cur_checkpoint = checknumber
			print("cur_checkpoint set to checknumber")
		print("body checked correctly")
	print("body detected")
