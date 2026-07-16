extends Label
var error :String
var errorr: bool = false

func _ready():
	shared.error.clear()
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if errorr == false:

		if len(shared.error) > 0:
			errorr = true
			error = shared.error[0]

			shared.error.remove_at(0)
			_error_text_readout(error)
			errorr == false

func _physics_process(delta):		
	if self.text == "":
		visible = false
	else:
		visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _error_text_readout(text):
	self.text = text
	print(str("error", text))
	await get_tree().create_timer(5).timeout
	self.text = ""
