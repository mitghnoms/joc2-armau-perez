extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.




func _on_Area2D_body_entered(body):
	body.global_position = Vector2(13152,1150)
	$misil2.global_position = Vector2(21727,1363)
