extends Area2D

func _ready():
	randomize()
	print(randi()%20) # This is to prove that the scene has reloaded.


func _on_DeathPit_body_entered(body):
	# This implies that the level node must be a child of
	# a Node with sceneManager.gd
	var scene_loader = get_node("/root/Main")
	var load_level_function = scene_loader.get("load_level_function")
	var current_level = scene_loader.get("current_level")
	load_level_function.call_func(current_level)
