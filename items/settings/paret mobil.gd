extends KinematicBody2D

var velocitat := 250
var moute = false

func _ready():
	pass 

func _process(delta):
	if moute:
		move_and_slide(Vector2.UP * velocitat)
	


func _on_Area2D_body_entered(body):
	moute = true

