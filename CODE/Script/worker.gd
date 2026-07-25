extends CharacterBody2D
var direction = 0
var saveddirection :int = 0
const SPEED = 75.0
const JUMP_VELOCITY = -400.0
var movex :float = 0
@onready var onscreen = $VisibleOnScreenNotifier2D
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):

	if onscreen.is_on_screen() == true:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
	
		# Handle jump.
	
	
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if shared.px > position.x:
			direction = 1
		elif shared.px < position.x:
			direction = -1
		else:
			direction = 0
		if direction and direction != saveddirection:
			velocity.x += direction * SPEED / 8
		else:
			velocity.x = move_toward(velocity.x, 0, 30)
	
		if velocity.x > SPEED:
			velocity.x = SPEED
		elif velocity.x < -SPEED:
			velocity.x = -SPEED
		
		move_and_slide()

		if direction == -1:
			sprite.flip_h = true
		elif direction == 1:
			sprite.flip_h = false
			

func _on_area_2d_2_area_entered(area):
	print(area.get_groups())
	if area.is_in_group("hole"):
		saveddirection = direction


func _on_area_2d_2_area_exited(area):
	saveddirection = 0


func _PLAYER(body):
	if body is Player:
		get_tree().reload_current_scene()
