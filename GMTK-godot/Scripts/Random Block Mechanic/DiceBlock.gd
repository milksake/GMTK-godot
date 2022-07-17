tool
extends Area2D

signal dice_block_touched

var matrix_transformation

func _ready():
	var random_block_area = get_parent().get_parent().get_node("RandomBlockArea")
	matrix_transformation = random_block_area.get("matrix_transformation")
	
func _on_DiceBlock_body_entered(_body):
	emit_signal("dice_block_touched")
