extends Area2D


var direccio = Vector2.RIGHT
var velocitat = direccio *500


# Called when the node enters the scene tree for the first time.
func _ready():
	velocitat = direccio * 500
	$Sprite.rotation = velocitat.angle()
func _process(delta):
	position += velocitat * delta



