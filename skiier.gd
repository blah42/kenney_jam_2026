extends CharacterBody2D


const SPEED = 80
const TRAIL_LEN = 16
var state = 0
var lose = false

func _ready() -> void:
	Global.playerState = state
	$EndScreen.hide()

func _physics_process(delta: float) -> void:
	var inputDir = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = inputDir * SPEED
	Global.playerVelocity = velocity
	move_and_slide()
	#print(position)
	if Input.is_action_just_pressed("Scale"):
		if state==0:
			state = 1
			Global.playerState = 1
			$AnimatedSprite2D.scale = Vector2(2, 2)
		else:
			state = 0
			Global.playerState = 0
			$AnimatedSprite2D.scale = Vector2(1, 1)
			
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
func _on_area_2d_area_entered(area: Area2D) -> void:
		if area.name == "flag":
			if state == 0:
				score()
		elif area.name == "GateScore":
			if state == 1:
				score()
		elif area.name == "Skilift":
			if state == 1:
				loseState()
		elif area.is_in_group("Snowman"):
			if state == 0:
				loseState()
			if state == 1:
				score()
		elif area.name=="Tree":
			loseState()
		elif area.name=="Wolf":
			if state==0:
				loseState()
				
func score():
	Global.score += 10
	
func loseState():
	get_tree().change_scene_to_file("res://endScreen.tscn")

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Level.tscn")
