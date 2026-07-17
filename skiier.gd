extends CharacterBody2D


const SPEED = 80
const TRAIL_LEN = 16
var state = 0


func _physics_process(delta: float) -> void:

	var inputDir = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = inputDir * SPEED
	move_and_slide()
	#print(position)
	if Input.is_action_just_pressed("Scale"):
		if state==0:
			state = 1
			$AnimatedSprite2D.scale = Vector2(2, 2)
		else:
			state = 0
			$AnimatedSprite2D.scale = Vector2(1, 1)
			
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		


func _on_area_2d_area_entered(area: Area2D) -> void:
		print(area.name)
		if area.name == "Skilift":
			if state == 1:
				print("Lose")
		elif area.name == "Snowman":
			if state == 0:
				print("Lose")
