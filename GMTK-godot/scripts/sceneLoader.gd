extends Node

var current_level = 0 
var load_level_function

func _ready():
	load_level_function = funcref(self, "load_level")
	load_level_function.call_func(current_level)


func load_level(level_number):
	if(get_child_count() > 0):
		get_child(0).queue_free()
		
	var level_name = "Level_" + str(level_number) + ".tscn"
	var level_n = load("res://scenes/" + level_name).instance()
	add_child(level_n)
