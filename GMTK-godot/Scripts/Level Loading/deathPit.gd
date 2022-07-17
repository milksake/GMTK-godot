extends Area2D

onready var death_sound = get_node("DeathSound")

func _on_DeathPit_body_entered(body):
	
	# Death sound first:
	death_sound.play(0)
	yield(get_tree().create_timer(death_sound.stream.get_length()), "timeout")
	death_sound.stop()
	
	# This implies that the level node must be a child of
	# a Node with sceneManager.gd
	var scene_loader = get_node("/root/Main")
	var load_level_function = scene_loader.get("load_level_function")
	var current_level = scene_loader.get("current_level")
	load_level_function.call_func(current_level)
