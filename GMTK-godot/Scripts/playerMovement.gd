extends KinematicBody2D

# Declare member variables here. Examples:
var velocity: = Vector2.ZERO
export var gravity: = 1000.0
export var speed: = Vector2(300.0, 1000.0)

var player_anim

onready var jump_sound = get_node("JumpSound")

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.ZERO
	player_anim = get_node("AnimatedSprite")
	player_anim.playing = true

func _physics_process(delta):
	var direction = get_player_direction()
	var new_velocity = Vector2.ZERO
	new_velocity.x = speed.x * direction.x
	new_velocity.y = velocity.y + gravity * delta
	if direction.y == -1: # when jumping
		new_velocity.y = -speed.y
	if Input.is_action_just_released("jump") and velocity.y < 0: # when jump stops
		new_velocity.y = 0
	velocity = move_and_slide(new_velocity, Vector2.UP)
	
	# For player animation:
	
	if velocity.x != 0:
		player_anim.animation = "run"
	else:
		player_anim.animation = "idle"
		

func get_player_direction():
	var player_direction = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		player_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		player_direction.x += 1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		player_direction.y = -1
	return player_direction
