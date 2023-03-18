extends KinematicBody2D

var velocitat := 200
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN *350
var direccio = Vector2.ZERO
var salt := 250
var punts := 0



func _process(delta):
	direccio.x = 0
	moviment.x = 0
	
	if Input.is_action_pressed("ves_dreta"):
		direccio += Vector2.RIGHT
		
	
		
		
	if Input.is_action_pressed("ves_esquerra"):
		direccio += Vector2.LEFT
		
		
	if Input.is_action_just_pressed("ves_amunt") and is_on_floor():
		moviment.y = -salt
		$soundsalta.playing = true
		
	if Input.is_action_just_pressed("restart"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	
		
	
	moviment += direccio.normalized() * velocitat
	moviment += gravetat * delta
	
	moviment = move_and_slide(moviment, Vector2.UP)
	
	
	if moviment.y < 0:
		$Monigoteanimat.play("saltar")
		
	elif moviment.x > 0:
		$Monigoteanimat.play("caminar")
		$Monigoteanimat.flip_h = false
		if Input.is_action_just_pressed("ves_dreta") and is_on_floor():
			$soundcorre.playing = true
		
	elif moviment.x < 0:
		$Monigoteanimat.play("caminar")
		$Monigoteanimat.flip_h = true
		if Input.is_action_just_pressed("ves_esquerra") and is_on_floor():
			$soundcorre.playing = true
		
	elif moviment.x == 0 and is_on_floor():
		$Monigoteanimat.play("parat")
		$soundcorre.playing = false
		
	if is_on_floor()== false:
		$soundcorre.playing = false
		

		
	

func _on_monedes_body_entered(body):
	punts += 1
	$moneda.playing = true
	$CanvasLayer/PUNTS.text = "MONEDES: %d" % [punts]
	
