extends Node

var current_level = 0 
var load_level_function
var load_next_level_function
var screen_shake := 0
onready var camera: Camera2D

var shake_screen_funcref 

export (AudioStream) var bgm
onready var persistent_bgm: AudioStreamPlayer

func _ready():
	camera = Camera2D.new()
	camera.current = true
	camera.anchor_mode = 0
	add_child(camera)
	
	shake_screen_funcref = funcref(self, "shake_screen")
	
	load_level_function = funcref(self, "load_level")
	load_next_level_function = funcref(self, "load_next_level")
	load_level_function.call_func(current_level)

func _process(_delta):
	camera.set_offset(Vector2(rand_range(-screen_shake, screen_shake), rand_range(-screen_shake, screen_shake)))

	if Input.is_action_just_pressed("reset"):
		load_level(current_level)

func load_level(level_number):
	if(get_child_count() > 1):
		get_child(get_child_count()-1).queue_free()
	else:
		persistent_bgm = AudioStreamPlayer.new()
		add_child(persistent_bgm)
		persistent_bgm.stream = bgm
		persistent_bgm.bus = "Music"
		persistent_bgm.playing = true
		
	var level_name = "Level_" + str(level_number) + ".tscn"
	var level_n: Node = load("res://Levels/" + level_name).instance()
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

func shake_screen():
	screen_shake = 12
	yield(get_tree().create_timer(0.1), "timeout")
	screen_shake = 0
