extends AudioStreamPlayer2D

onready var kinematic_body_2d = get_parent()

func _process(_delta):
	# print(kinematic_body_2d.velocity.y)
	if Input.is_action_just_pressed("jump") and kinematic_body_2d.velocity.y <= 0:
		stop()
		play(0)
		yield(get_tree().create_timer(stream.get_length()), "timeout")
		stop()
