extends Area2D
@onready var label_5 = $"../Label5"
var cur_text

# Called when the node enters the scene tree for the first time.
func _ready():
	cur_text = label_5.text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tutorial.firstdoublejump == true:
		if shared.doublejump_collected == 0:
			if tutorial.getdoublejumpback == true and tutorial.toggle == false:
				tutorial.toggle = true
				await get_tree().create_timer(1).timeout
				if tutorial.getdoublejumpback == true:
					await get_tree().create_timer(1).timeout
					label_5.text = str(cur_text, " ... really? Fine I will give you another one.")
					await get_tree().create_timer(1).timeout
					shared.doublejump_collected += 1
					
					tutorial.toggle = false
				else:
					tutorial.toggle = false
	if shared.doublejump_collected >= 1:
			tutorial.firstdoublejump = true


func _on_body_exited(body):
	if body is Player:
		tutorial.getdoublejumpback = false
func _on_body_entered(body):
	if body is Player:
		tutorial.getdoublejumpback = true
