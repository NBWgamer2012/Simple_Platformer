extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	shared.menupage = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_pressed():
	shared.menupage = 2





func _on_button_4_pressed():
	shared.menupage = 0


func _on_button_3_pressed():
	shared.menupage = 1
