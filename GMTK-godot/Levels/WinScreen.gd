extends Control

onready var ui_audio = get_node("UIAudio")

func _on_Button_button_down():
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_Button_mouse_entered():
	ui_audio.play(0)
	yield(get_tree().create_timer(ui_audio.stream.get_length()), "timeout")
	ui_audio.stop()
