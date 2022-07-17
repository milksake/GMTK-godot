extends Node2D

var random_blocks = []
onready var dice_block = get_node("DiceBlock")
onready var randomizer_area = get_parent().get_node("RandomBlockArea")

var matrix_transformation

func _ready():
	
	# Gets all RandomBlock that is childed to this node,
	# then appends them to the array - random_blocks
	# All RandomBlocks have a property called is_random_block
	for i in range(0, get_child_count()):
		var child_to_check = get_child(i)
		# print("Checking " + child_to_check.name)
		var is_random_block = child_to_check.get("is_random_block")
		if is_random_block != null:
			# print("Added " + child_to_check.name)
			random_blocks.append(child_to_check)
	
	# Gets the matrix_transformation funcref:
	matrix_transformation = randomizer_area.get("matrix_transformation")
	
	# Subscribe to an event in dice_block:
	dice_block.connect("dice_block_touched", self, "randomize_blocks")

func randomize_blocks():
	randomize()
	for i in range(random_blocks.size()):
		randomize_block(random_blocks[i])

# This is to be used with a RandomBlock
func randomize_block(_block):
	# Get the funcref for the is_anything_in_clearance_area function
	var clearance_area_clear = _block.get("clearance_area_clear")
	# Randomize the block position:
	_block.global_position = matrix_transformation.call_func(randf(), randf())
	
	# Randomize the block position, until the block 
	# has complete clearance.
	if clearance_area_clear.call_func() == true:
		return
	else:
		randomize_block(_block)
