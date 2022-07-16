extends VBoxContainer

# Declare member variables here. Examples:
onready var g_label = $GLabel
onready var sx_label = $SXLabel
onready var sy_label = $SYLabel
signal gravity_changed(value)
signal speedX_changed(value)
signal speedY_changed(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	g_label.text = str($Gravity/Slider.value)
	sx_label.text = str($SpeedX/Slider.value)
	sy_label.text = str($SpeedY/Slider.value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_GSlider_value_changed(value):	
	g_label.text = str($Gravity/Slider.value)
	emit_signal("gravity_changed", value)


func _on_SXSlider_value_changed(value):
	sx_label.text = str($SpeedX/Slider.value)
	emit_signal("speedX_changed", value)


func _on_SYSlider_value_changed(value):
	sy_label.text = str($SpeedY/Slider.value)
	emit_signal("speedY_changed", value)
