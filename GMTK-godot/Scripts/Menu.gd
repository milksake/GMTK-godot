extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btnPlay_pressed():
	get_tree().change_scene("res://Levels/Main.tscn")


func _on_btnQuit_pressed():
	get_tree().quit()


onready var ui_audio = get_node("UIAudio")

func _on_btnPlay_mouse_entered():
	ui_audio.play(0)
	yield(get_tree().create_timer(ui_audio.stream.get_length()), "timeout")
	ui_audio.stop()

func _on_btnQuit_mouse_entered():
	ui_audio.play(0)
	yield(get_tree().create_timer(ui_audio.stream.get_length()), "timeout")
	ui_audio.stop()
