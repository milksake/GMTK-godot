extends Node

var current_level = 0 
var load_level_function
var load_next_level_function

var busy_loading = false

func _ready():
	load_level_function = funcref(self, "load_level")
	load_next_level_function = funcref(self, "load_next_level")
	load_level_function.call_func(current_level)


func load_level(level_number):
	if(get_child_count() > 0):
		get_child(0).queue_free()
		
	var level_name = "Level_" + str(level_number) + ".tscn"
	var level_n = load("res://Levels/" + level_name).instance()
	add_child(level_n)


func load_next_level():
	var path_to_next_level_file = "res://Levels/Level_" + str(current_level+1) + ".tscn" 
	if(does_file_exist(path_to_next_level_file)):
		current_level += 1
		load_level(current_level)


func does_file_exist(path_to_file) -> bool:
	var directory = Directory.new()
	var doesFileExist = directory.file_exists(path_to_file)
	return doesFileExist
