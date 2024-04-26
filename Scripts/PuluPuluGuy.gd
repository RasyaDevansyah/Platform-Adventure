extends CharacterBody2D


const SPEED : float = 400.0
const JUMP_VELOCITY : float = -900.0
const WALL_JUMP_PUSH_BACK : float = 300.0
const ACCELERATION = 40
const FRICTION = 40


@onready var animatedSprite2D : AnimatedSprite2D = $AnimatedSprite2D
@onready var animationTree : AnimationTree = $AnimationTree
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
			animationTree.set("parameters/DoubleJump/request" ,  AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

	if is_on_wall() and !is_on_floor():
		if direction:
			isWallSliding = true
		else:
			isWallSliding = false
	else:
		isWallSliding = false
		
	if isWallSliding:
		velocity.y = min(velocity.y , wallSlideGravity)
		
	if velocity.x < 0:	
		animatedSprite2D.flip_h = true
	elif velocity.x > 0:
		animatedSprite2D.flip_h = false
		
	move_and_slide()
	
	if is_on_floor():
		if velocity.x != 0:
			animationTree.set("parameters/MovementState/blend_position", 2)
		else:
			animationTree.set("parameters/MovementState/blend_position", 1)
	else:
		if velocity.y < 0:
			animationTree.set("parameters/MovementState/blend_position", -1)
		else:
			animationTree.set("parameters/MovementState/blend_position", -2)


	if is_on_wall() and !is_on_floor() and direction:
		animationTree.set("parameters/DoubleJump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
		animationTree.set("parameters/MovementState/blend_position", 0)

func Hit(knockBack : Vector2 = global_transform.origin * Vector2.RIGHT):
	velocity = knockBack * 800
	animationTree.set("parameters/DoubleJump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
	animationTree.set("parameters/Transition/transition_request", "Dead")
	await get_tree().create_timer(0.3).timeout
	process_mode = Node.PROCESS_MODE_DISABLED
	
