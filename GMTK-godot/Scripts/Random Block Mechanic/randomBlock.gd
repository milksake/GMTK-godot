tool
extends StaticBody2D

export var size = Vector2(2, 2)

var dice_block
var matrix_transformation

func _ready():
	adjust_size()
	
	# This is assuming that the DiceBlock and 
	# the other RandomBlocks are siblings.
	dice_block = get_parent().get_node("DiceBlock")
	
	# Subscribe to the dice_block's event.
	dice_block.connect("dice_block_touched", self, "move")
	
	# Find the RandomBlockArea object, which is a direct 
	# child of the level node
	var random_block_area = get_parent().get_parent().get_node("RandomBlockArea")
	matrix_transformation = random_block_area.get("matrix_transformation")

func _process(delta):
	if(Engine.editor_hint):
		adjust_size()

func adjust_size():
	get_node("CollisionShape2D").scale = size
	get_node("Sprite").scale = size

func move():
	# matrix_transformation(i_hat, j_hat)
	# where both of them are floats.
	randomize()
	var new_pos = matrix_transformation.call_func(randf(), randf())
	global_position = new_pos
