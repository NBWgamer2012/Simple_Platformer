extends Label
var see :bool














# Called when the node enters the scene tree for the first time.
func _ready():
	if see == false:
		visible = false
	else:
		visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if see == false:
			visible = true
			see = true
		else:
			visible = false
			see = false
	
