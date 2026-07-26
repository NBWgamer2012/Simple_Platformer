extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	self.value = shared.volume
@warning_ignore("unused_parameter")
func _process(delta):
	shared.volume = self.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(self.value / 100))
