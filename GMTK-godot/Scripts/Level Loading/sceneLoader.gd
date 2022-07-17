extends Node

var current_level = 0 
var load_level_function
var load_next_level_function
export var screen_shake := 0
onready var camera: Camera2D

func _ready():
	camera = Camera2D.new()
	camera.current = true
	camera.anchor_mode = 0
	add_child(camera)
	load_level_function = funcref(self, "load_level")
	load_next_level_function = funcref(self, "load_next_level")
	load_level_function.call_func(current_level)

func _process(delta):
	camera.set_offset(Vector2(rand_range(-screen_shake, screen_shake), rand_range(-screen_shake, screen_shake)))

func load_level(level_number):
	if(get_child_count() > 1):
		get_child(1).queue_free()
		
	var level_name = "Level_" + str(level_number) + ".tscn"
	var level_n = load("res://Levels/" + level_name).instance()
	call_deferred("add_child", level_n)


func load_next_level():
	var path_to_next_level_file = "res://Levels/Level_" + str(current_level+1) + ".tscn" 
	if(does_file_exist(path_to_next_level_file)):
		current_level += 1
		load_level(current_level)


func does_file_exist(path_to_file) -> bool:
	var directory = Directory.new()
	var doesFileExist = directory.file_exists(path_to_file)
	return doesFileExist
