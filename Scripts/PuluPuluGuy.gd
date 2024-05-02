extends CharacterBody2D

signal _playerDeath


const SPEED : float = 160.0
const JUMP_VELOCITY : float = -360.0
const WALL_JUMP_PUSH_BACK : float = 120.0
const ACCELERATION = 16
const FRICTION = 16

@onready var tile_map :TileMap = $"../TileMap"
@onready var animatedSprite2D : AnimatedSprite2D = $AnimatedSprite2D
@onready var animationTree : AnimationTree = $AnimationTree
@onready var platformCollidingChecker : ShapeCast2D = $PlatformCollidingChecker
@onready var playerUI = $PlayerUI as PlayerUI

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var wallSlideGravity : float = 100

var isWallSliding : bool = false
var canDoubleJump : bool = true
var disablePlayer : bool = false


func _physics_process(delta):
	var direction : float = Input.get_axis("left", "right") if not disablePlayer else 0.0
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED * scale.x, ACCELERATION * scale.x)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * scale.x)
		
	if not is_on_floor():
		velocity.y += gravity * delta * scale.x
		if platformCollidingChecker.is_colliding() == false:
			set_collision_mask_value(2, true)
	elif is_on_floor():
		if Input.is_action_just_pressed("down"):
			if is_on_wall() and is_on_floor():
				position.x += get_wall_normal().x * 3
				
			set_collision_mask_value(2, false)
		
	if is_on_floor() or isWallSliding: 
		canDoubleJump = true
	
	
	if Input.is_action_just_pressed("jump") and not disablePlayer:
		if is_on_floor():
			velocity.y = JUMP_VELOCITY * scale.x
		elif  direction and isWallSliding:
			velocity.y = JUMP_VELOCITY * 80/100 * scale.x
			velocity.x = WALL_JUMP_PUSH_BACK * -direction * scale.x
		elif canDoubleJump:
			canDoubleJump = false
			velocity.y = JUMP_VELOCITY * 80/100 * scale.x
			animationTree.set("parameters/DoubleJump/request" ,  AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)



	if is_on_wall() and not is_on_floor():
		isWallSliding = direction
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider() is TileMap:
				var tileLayer = tile_map.get_layer_for_body_rid(collision.get_collider_rid())
				if tileLayer == 2:
					isWallSliding = false
					break
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


	if isWallSliding and !is_on_floor() and direction:
		animationTree.set("parameters/DoubleJump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
		animationTree.set("parameters/MovementState/blend_position", 0)

func Hit(knockBack : Vector2 = global_transform.origin * Vector2.RIGHT):
	emit_signal("_playerDeath")
	velocity = knockBack * 320 * scale.x
	animationTree.set("parameters/DoubleJump/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
	animationTree.set("parameters/Transition/transition_request", "Dead")
	await get_tree().create_timer(0.3).timeout
	process_mode = Node.PROCESS_MODE_DISABLED
	
func DisablePlayer():
	disablePlayer = true
