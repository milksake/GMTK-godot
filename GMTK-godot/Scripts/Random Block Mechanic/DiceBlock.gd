tool
extends Area2D

signal dice_block_touched

var matrix_transformation
var is_dice_block = true

export var dice_color = Color.purple

onready var randomizer = get_parent()

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
