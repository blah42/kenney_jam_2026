extends Node2D


# Called when the node enters the scene tree for the first time.
var map_speed = 20 
const screen_height = 9*16
var map1 = preload("res://Assets/MapSegments/MapSegment1.res")
var map2 = preload("res://Assets/MapSegments/MapSegment5.res")
var map3 = preload("res://Assets/MapSegments/MapSegment3.res")
var screentime = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screentime = 0
	$EndScreen/Button.disabled = true
	$EndScreen/RichTextLabel2.text = "highscore   " + str(Global.highScore)
	$EndScreen/Score.text = "score    " + str(Global.score)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(screentime > .1):
		$EndScreen/Button.disabled = false
	screentime= screentime+delta
	mapMove(map_speed,delta)
func mapMove(speed,delta):
	$Map.move_local_y(-delta*speed)
	for i in $Map.get_children(false):
		#print(i)
		if(i.global_position.y < -screen_height*2):
			i.move_local_y(screen_height*5)
			var c = i.global_position
			#print(i)
			i.queue_free()
			var randMap = randi_range(1,3)
			var d
			match randMap:
				1:
					d = map1.instantiate()
				2:
					d = map2.instantiate()
				3:
					d = map3.instantiate()
				_:
					d = map3.instantiate()
			d.global_position = c
			$Map.add_child(d)
			d.global_position = c
pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://titleScreen.tscn")
	pass # Replace with function body.
