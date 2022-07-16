tool
extends Area2D

export var origin = Vector2.ZERO
export var matrix_x = Vector2.RIGHT
export var matrix_y = Vector2.DOWN

var matrix_transformation

func _enter_tree():
	if(Engine.editor_hint == false):
		matrix_transformation = funcref(self, "matrix_trans")

# make sure that i_hat < 1 and j_hat < 1!
func matrix_trans(i_hat, j_hat):
	var input = Vector2(i_hat, j_hat)
	var output_x = input.x * matrix_x
	var output_y = input.y * matrix_y
	return (origin + output_x + output_y)

# Area visualization:
func _process(_delta):
	if (Engine.editor_hint):
		var area = get_node("CollisionPolygon2D")
		
		var points = [origin, 
		origin + matrix_y,
		origin + matrix_x + matrix_y,
		origin + matrix_x]
		var new_polygon = PoolVector2Array(points)
		
		area.polygon = new_polygon
