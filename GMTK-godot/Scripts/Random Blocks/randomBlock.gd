tool
extends StaticBody2D

export var size = Vector2(2, 2)

var dice_block

func _ready():
	adjust_size()
	
	# This is assuming that the DiceBlock and 
	# the other RandomBlocks are siblings.
	dice_block = get_parent().get_node("DiceBlock")
	
	# Subscribe to the dice_block's event.
	dice_block.connect("dice_block_touched", self, "move")

func _process(delta):
	if(Engine.editor_hint):
		adjust_size()

func adjust_size():
	get_node("CollisionShape2D").scale = size
	get_node("Sprite").scale = size

func move():
	print(name + " is moving somewhere else!")
