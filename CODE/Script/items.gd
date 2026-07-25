extends Node2D
var is_collected :bool = false
@onready var items_collected = $"../../Camera2D/Items_COLLECTED"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Collectiables.items[int(name)] == true:
		position[1] += 10000
	items_collected.text = str(Collectiables.items_COUNT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		Collectiables.items_COUNT += 1
		items_collected.text = str(Collectiables.items_COUNT)
		position[1] += 10000
		is_collected = true
		Collectiables.items[int(name)] = is_collected
