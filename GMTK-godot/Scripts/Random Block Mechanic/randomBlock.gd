tool
extends StaticBody2D

export var size = Vector2(2, 2)
export var clearance_radius = 3
export var block_color = Color.purple

var dice_block
var is_random_block = true


func _ready():
	adjust_size()
	get_node("Sprite").self_modulate = block_color

func _process(_delta):
	if(Engine.editor_hint):
		adjust_size()
		get_node("Sprite").self_modulate = block_color

func adjust_size():
	get_node("CollisionShape2D").scale = size
	get_node("Sprite").scale = size
	get_node("ClearanceVisualizer").scale = Vector2(1, 1) * clearance_radius
