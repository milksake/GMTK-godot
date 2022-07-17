tool
extends StaticBody2D

export var size = Vector2(2, 2)

var dice_block

var is_random_block = true
var clearance_area_clear

func _ready():
	adjust_size()
	clearance_area_clear = funcref(self, "is_anything_in_clearance_area")

func _process(_delta):
	if(Engine.editor_hint):
		adjust_size()

func adjust_size():
	get_node("CollisionShape2D").scale = size
	get_node("Sprite").scale = size

func is_anything_in_clearance_area():
	# To be changed later
	return true
