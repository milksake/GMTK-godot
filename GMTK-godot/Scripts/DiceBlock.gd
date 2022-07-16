extends Area2D

signal dice_block_touched

func _on_DiceBlock_body_entered(body):
	emit_signal("dice_block_touched")
