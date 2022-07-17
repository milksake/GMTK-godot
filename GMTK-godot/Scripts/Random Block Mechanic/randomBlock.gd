tool
extends StaticBody2D

export var size = Vector2(2, 2)
export var clearance_radius = 3

var dice_block
var is_random_block = true


func _ready():
	adjust_size()


func _process(_delta):
	if(Engine.editor_hint):
		adjust_size()

func adjust_size():
	get_node("CollisionShape2D").scale = size
	get_node("Sprite").scale = size
	get_node("ClearanceVisualizer").scale = Vector2(1, 1) * clearance_radius
