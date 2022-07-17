tool
extends Area2D

signal dice_block_touched

var matrix_transformation
var is_dice_block = true

export var dice_color = Color.purple

onready var randomizer = get_parent()
onready var main_node = get_node_or_null("/root/Main")

func _ready():
	var random_block_area = get_parent().get_node("RandomBlockArea")
	matrix_transformation = random_block_area.get("matrix_transformation")
	connect("dice_block_touched", randomizer, "randomize_blocks")
	get_node("Sprite").self_modulate = dice_color
	
func _process(delta):
	if Engine.editor_hint:
		get_node("Sprite").self_modulate = dice_color

func _on_DiceBlock_body_entered(_body):
	emit_signal("dice_block_touched")
	if main_node != null:
		var shake_screen_funcref = main_node.get("shake_screen_funcref")
		shake_screen_funcref.call_func()
