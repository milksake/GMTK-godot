extends Panel

export var entrance_duration = 0.2

var tween

func _ready():
	tween = get_node("Tween")
	var final_pos = rect_position + 1000 * Vector2.UP
	
	tween.interpolate_property(self, "rect_position", null, final_pos, 
	entrance_duration, Tween.TRANS_QUAD, Tween.EASE_OUT)
	
	tween.start()
