tool
extends Node2D

var random_blocks = []
var dice_blocks = []

onready var randomizer_area = get_node("RandomBlockArea")

var matrix_transformation

func _get_configuration_warning():
	return "Needs RandomBlock scenes, ONLY ONE DiceBlock scene AND a RandomBlockArea scene as children! This is a reminder, not an error."

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
	
	for i in range(0, get_child_count()):
		var child_to_check = get_child(i)
		# print("Checking " + child_to_check.name)
		var is_dice_block = child_to_check.get("is_dice_block")
		if is_dice_block != null:
			# print("Added " + child_to_check.name)
			dice_blocks.append(child_to_check)
	
	# Gets the matrix_transformation funcref:
	matrix_transformation = randomizer_area.get("matrix_transformation")
	
	# Subscribe randomize_blocks() to an event in dice_block:
	# dice_block.connect("dice_block_touched", self, "randomize_blocks")

func randomize_blocks():
	var placed_blocks = []
	for i in range(random_blocks.size()):
		if i == 0:
			random_blocks[i].global_position = matrix_transformation.call_func(randf(), randf())
			placed_blocks.append(random_blocks[i])
		else:
			randomize_block(placed_blocks, random_blocks[i])
			placed_blocks.append(random_blocks[i])

	randomize_dice_pos()

func randomize_block(previous_blocks, new_block):
	randomize()
	var new_pos = matrix_transformation.call_func(randf(), randf())
	var right_to_set_pos = true
	
	for n in range(previous_blocks.size()):
		var distance_from_block = new_pos.distance_to(previous_blocks[n].global_position)
		var clearance_radius_of_block = previous_blocks[n].get("clearance_radius")

		if distance_from_block < clearance_radius_of_block:
			right_to_set_pos = false
			randomize_block(previous_blocks, new_block)
	
	# This is so that the previous calls of randomize_block
	# can't set it back to the 'wrong' position.
	if right_to_set_pos:
		new_block.global_position = new_pos

func randomize_dice_pos():
	for i in range(dice_blocks.size()):
		var random_block_1 = random_blocks[randi()%random_blocks.size()]
		dice_blocks[i].global_position = random_block_1.global_position + Vector2.UP * random_block_1.get("clearance_radius")
