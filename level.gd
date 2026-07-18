extends Node2D

var map_speed = 100 
const screen_height = 9*16
var map1 = preload("res://Assets/MapSegments/MapSegment1.res")
var map2 = preload("res://Assets/MapSegments/MapSegment5.res")
var map3 = preload("res://Assets/MapSegments/MapSegment3.res")
var map4 = preload("res://Assets/MapSegments/MapSegment4.res")
var map5 = preload("res://Assets/MapSegments/MapSegment6.res")
var map6 = preload("res://Assets/MapSegments/MapSegment7.res")
var map7 = preload("res://Assets/MapSegments/MapSegment8.res")
var map8 = preload("res://Assets/MapSegments/MapSegment9.res")
var map9 = preload("res://Assets/MapSegments/MapSegment10.res")
var map10 = preload("res://Assets/MapSegments/MapSegment11.res")
var map11 = preload("res://Assets/MapSegments/MapSegment12.res")
var map12 = preload("res://Assets/MapSegments/MapSegment13.res")
var map13 = preload("res://Assets/MapSegments/MapSegment14.res")
var map14 = preload("res://Assets/MapSegments/MapSegment15.res")
var map15 = preload("res://Assets/MapSegments/MapSegment16.res")
var map16 = preload("res://Assets/MapSegments/MapSegment17.res")
var map17 = preload("res://Assets/MapSegments/MapSegment18.res")
var map18 = preload("res://Assets/MapSegments/MapSegment19.res")
var map19 = preload("res://Assets/MapSegments/MapSegment20.res")
var map20 = preload("res://Assets/MapSegments/MapSegment21.res")
var scoretime = 0
var lowerBound = 5
var wolfProb = 1
var wolfRate = 1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var character = preload("res://Skiier.tscn").instantiate()
	$Player.add_child(character, true)
	var startPosition = Vector2(-120, -120)
	$Score.position = startPosition


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.score>200:
		lowerBound = 20
		wolfRate = 200
	wolfProb = randi()%wolfRate
	if $Enemies.get_child_count()==0:
		if wolfProb==1:
			var wolfy = preload("res://wolf.tscn").instantiate()
			wolfy.position = Vector2($Player.get_child(0).position.x, -150)
			$Enemies.add_child(wolfy, true)
	
	$Score.text = str(Global.score)
	if(scoretime > 1):
		Global.score = Global.score + 1
		scoretime = 0
	scoretime += delta
	mapMove(map_speed,delta)
	if($Player.global_position.y > 0): get_tree().quit() #replace with score and title screen
	pass
	
func mapMove(speed,delta):
	$Map.move_local_y(-delta*speed)
	for i in $Map.get_children(false):
		if(i.global_position.y < -screen_height*2):
			i.move_local_y(screen_height*5)
			var c = i.global_position
			i.queue_free()
			var randMap = randi_range(1,lowerBound)
			var d
			match randMap:
				11:
					d = map1.instantiate()
				12:
					d = map2.instantiate()
				13:
					d = map3.instantiate()
				14:
					d = map4.instantiate()
				15:
					d = map5.instantiate()
				16:
					d = map16.instantiate()
				17:
					d = map17.instantiate()
				18:
					d = map18.instantiate()
				19:
					d = map19.instantiate()
				20:
					d = map20.instantiate()
				6:
					d = map6.instantiate()
				7:
					d = map7.instantiate()
				8:
					d = map8.instantiate()
				9:
					d = map9.instantiate()
				10:
					d = map10.instantiate()
				1:
					d = map11.instantiate()
				2:
					d = map12.instantiate()
				3:
					d = map13.instantiate()
				4:
					d = map14.instantiate()
				5:
					d = map15.instantiate()
				_:
					d = map3.instantiate()
			d.global_position = c
			$Map.add_child(d)
			d.global_position = c
	
