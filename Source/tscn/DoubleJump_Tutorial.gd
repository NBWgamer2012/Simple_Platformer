extends Area2D
@onready var label_5 = $"../Label5"
var cur_text
var getdoublejumpback :bool = false
var firstdoublejump :bool = false
var toggle :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	cur_text = label_5.text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if firstdoublejump == true:
		if shared.doublejump_collected == 0:
			if getdoublejumpback == true and toggle == false:
				toggle = true
				await get_tree().create_timer(1).timeout
				if getdoublejumpback == true:
					await get_tree().create_timer(1).timeout
					label_5.text = str(cur_text, " ... really? Fine I will give you another one.")
					await get_tree().create_timer(1).timeout
					shared.doublejump_collected += 1
					toggle = false
				else:
					toggle = false
	if shared.doublejump_collected >= 1:
			firstdoublejump = true


func _on_body_exited(body):
	getdoublejumpback = false
func _on_body_entered(body):
	getdoublejumpback = true
