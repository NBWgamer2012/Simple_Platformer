extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.modulate.a = 0.25
	await get_tree().create_timer(0.2).timeout

	var tween = create_tween()

	tween.tween_property(self, "position", Vector2(position.x - size.x * 2.5, position.y), 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	text = shared.current_music_text

	
	
