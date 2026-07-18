extends Node2D

var map_speed = 100 
var score = 0
const screen_height = 9*16
var map1 = preload("res://Assets/MapSegments/MapSegment1.res")
var map2 = preload("res://Assets/MapSegments/MapSegment5.res")
var map3 = preload("res://Assets/MapSegments/MapSegment3.res")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var character = preload("res://Skiier.tscn").instantiate()
	$Player.add_child(character, true)
	var startPosition = Vector2(-120, -120)
	$Score.position = startPosition


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Score.text = str(score)
	score = score + 1
	mapMove(map_speed,delta)
	if($Player.global_position.y > 0): get_tree().quit() #replace with score and title screen
	pass
	
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
	
