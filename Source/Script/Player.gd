class_name Player
extends CharacterBody2D
@onready var sprite = $Sprite
@onready var debug_text = $"../Camera2D/Debug_TEXT"
@onready var checkpoint = $"../Checkpoints"
var doublejump :int = 0
@onready var double_jump_counter = $"../Camera2D/DoubleJump"
var SPEED :float = 300.0
var JUMP_VELOCITY :float = -350.0
var direction :float = 1
var xspeed :float = 0
var map_found :bool = false
func _ready():
	reset()
	for i in len(shared.cur_stage_start_positions):
		if shared.cur_stage == shared.cur_stage_start_positions[i][0]:
			position = Vector2i(shared.cur_stage_start_positions[i][1], shared.cur_stage_start_positions[i][2])
			map_found = true
	if map_found == false:
		print('failed to find player positioning, resetting...')
		get_tree().change_scene_to_file("res://tscn/reset.tscn")
		



func _physics_process(delta):

	if position.y >= 42:
		get_tree().reload_current_scene()


	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animation_controller("jump", direction)
	# Handle jump.
	if doublejump > 2:
		doublejump = 2


	if Input.is_action_just_pressed("w") and doublejump != 2:
		if shared.doublejump_collected > 0 and doublejump > 0:
			velocity.y = JUMP_VELOCITY
			doublejump += 1
			shared.doublejump_collected -= 1
		elif doublejump == 0 and is_on_floor():
			velocity.y = JUMP_VELOCITY
			doublejump += 1
	elif not Input.is_action_pressed("w") and velocity.y < 0:
		velocity.y /= 2
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("a", "d")
	if direction:
		xspeed += direction * SPEED/8
		if is_on_floor():
			animation_controller("walk", direction)
	else:
		xspeed = move_toward(xspeed, 0, SPEED/8)
		if is_on_floor():	
			animation_controller("idle", direction)	


	if xspeed > SPEED:
		xspeed = SPEED
	if xspeed < -SPEED:
		xspeed = -SPEED

	velocity.x = xspeed
	move_and_slide()
	shared.px = position.x
	shared.py = position.y
	
	if is_on_floor():
		doublejump = 0
	double_jump_counter.text = str(shared.doublejump_collected)





func animation_controller(cur_animation, cur_direction):
	if not cur_animation == "idle" or "walk":
		sprite.animation = cur_animation
	elif cur_animation == "idle":
		sprite.animation = "idle"
	else:
		sprite.animation = "walk"
	if cur_direction > 0:
		sprite.flip_h = false
	elif cur_direction < 0:
		sprite.flip_h = true
	debug_text.text = str(cur_animation, " / ", cur_direction, " / ", doublejump, " / ", xspeed ," / ", Engine.get_frames_per_second())




func reset():
	if shared.cur_checkpoint != 0:
		position = checkpoint.get_child(shared.cur_checkpoint - 1).position
	else:
		position = Vector2i(-127, -18)
