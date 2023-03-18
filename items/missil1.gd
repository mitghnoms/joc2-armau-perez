extends Area2D



# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.x -= 7
	




func _on_missil1_body_entered(body):
	body.global_position = Vector2(13152,1150)
	
