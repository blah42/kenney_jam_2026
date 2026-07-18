extends CharacterBody2D


var SPEED = 10

func _ready() -> void:
	velocity.y = 10
	$AnimatedSprite2D.play("walk")

func _process(delta: float) -> void:
	velocity.x = Global.playerVelocity.x
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Skiier":
		if Global.playerState:
			queue_free()
		else:
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.play("killMove")
