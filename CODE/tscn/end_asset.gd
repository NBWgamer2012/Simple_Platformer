extends StaticBody2D
@onready var player = $"../../Player"
var in_end :bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_end == true and Input.is_action_pressed("e"):
		get_tree().change_scene_to_file("res://tscn/main_menu.tscn")

func _on_area_2d_body_entered(body):
	if body is Player:
		in_end = true
		shared.interaction = true
#			get_tree().change_scene_to_file("res://tscn/main_menu.tscn")


func _on_area_2d_body_exited(body):
	if body is Player:
		in_end = false
		shared.interaction = false
