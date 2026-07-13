extends Node2D
var collected :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(collected)
	if Collectiables.collectedobjects[int(name)] == true:
		position[1] += 10000
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_collider_body_entered(body):
	if body is Player:
		shared.doublejump_collected += 1
		position[1] += 10000
		collected = true
		Collectiables.collectedobjects[int(name)] = collected
