extends Node2D

onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Gravity/Slider.value = player.gravity
	$Control/SpeedX/Slider.value = player.speed.x
	$Control/SpeedY/Slider.value = player.speed.y


func _on_Control_gravity_changed(value):
	player.gravity = value

func _on_Control_speedX_changed(value):
	player.speed.x = value

func _on_Control_speedY_changed(value):
	player.speed.y = value
