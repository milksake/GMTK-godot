extends Area2D


func _on_ClearFlag_body_entered(body):
	print("ClearFlag touched!")
	
	var scene_loader = get_node("/root/Main")
	var load_next_level_function = scene_loader.get("load_next_level_function")
	load_next_level_function.call_func()
