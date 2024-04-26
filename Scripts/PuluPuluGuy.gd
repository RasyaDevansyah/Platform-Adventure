extends CharacterBody2D


const SPEED : float = 400.0
const JUMP_VELOCITY : float = -900.0
const WALL_JUMP_PUSH_BACK : float = 300.0
const ACCELERATION = 40
const FRICTION = 40


@onready var animatedSprite2D = $AnimatedSprite2D
@onready var platformCollidingChecker : ShapeCast2D = $PlatformCollidingChecker
var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var wallSlideGravity : float = 100

var isWallSliding : bool = false
var canDoubleJump : bool = true


func _physics_process(delta):
	var direction : float = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
		
	if not is_on_floor():
		velocity.y += gravity * delta
		if animatedSprite2D.animation != "DoubleJump":
			if velocity.y < 0:
				animatedSprite2D.play("Jump")
			else:
				animatedSprite2D.play("Fall")
				
		if platformCollidingChecker.is_colliding() == false:
			set_collision_mask_value(2, true)
	elif is_on_floor():
		if Input.is_action_just_pressed("down"):
			set_collision_mask_value(2, false)
		
	if is_on_floor() or is_on_wall():
		canDoubleJump = true
	
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_wall() and direction:
			velocity.y = JUMP_VELOCITY * 80/100
			velocity.x = WALL_JUMP_PUSH_BACK * -direction
		elif canDoubleJump:
			canDoubleJump = false
			velocity.y = JUMP_VELOCITY * 80/100
			animatedSprite2D.play("DoubleJump")
		
	

	if is_on_wall() and !is_on_floor():
		if direction:
			isWallSliding = true
		else:
			isWallSliding = false
	else:
		isWallSliding = false
		
	if isWallSliding:
		velocity.y = min(velocity.y , wallSlideGravity)
		

	move_and_slide()
	
	if velocity.x != 0:
		if is_on_floor():
			animatedSprite2D.play("Run")

		if velocity.x < 0:
			animatedSprite2D.flip_h = true
		elif velocity.x > 0:
			animatedSprite2D.flip_h = false
	else:
		if is_on_floor():
			animatedSprite2D.play("Idle")
			
	if is_on_wall() and !is_on_floor() and direction:
		animatedSprite2D.play("WallSlide")
		
	
