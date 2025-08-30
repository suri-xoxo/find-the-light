extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const EXTRA_JUMPS = 1   # allows double jump (1 extra)

var jumps_left: int = EXTRA_JUMPS

func _ready() -> void:
	jumps_left = EXTRA_JUMPS

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_left = EXTRA_JUMPS   # reset jumps when on ground

	# Movement (left/right)
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Jump + double jump
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif jumps_left > 0:
			velocity.y = JUMP_VELOCITY
			jumps_left -= 1

	move_and_slide()
