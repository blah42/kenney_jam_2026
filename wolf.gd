extends CharacterBody2D


var SPEED = 10

func _ready() -> void:
	velocity.y = -10
	$AnimatedSprite2D.play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.x = 3
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "skiier":
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("killMove")
