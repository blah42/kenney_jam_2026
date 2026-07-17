extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	var inputDir = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = inputDir * SPEED
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
