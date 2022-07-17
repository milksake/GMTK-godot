extends RayCast2D

func _process(_delta):
	var raycast_result = get_collider()
	if raycast_result != null:
		print("Raycast Result: " + raycast_result.name)
