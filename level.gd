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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	displayScore(score)
	score = score + 1
	print(score)
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
pass

func displayScore(value):
	var startPosition = Vector2(0, 0)
	var zero = preload("res://kenney_tiny-ski/Tiles/tile_0084.png")
	var one = preload("res://kenney_tiny-ski/Tiles/tile_0085.png")
	var two = preload("res://kenney_tiny-ski/Tiles/tile_0086.png")
	var three = preload("res://kenney_tiny-ski/Tiles/tile_0087.png")
	var four = preload("res://kenney_tiny-ski/Tiles/tile_0088.png")
	var five = preload("res://kenney_tiny-ski/Tiles/tile_0089.png")
	var six = preload("res://kenney_tiny-ski/Tiles/tile_0090.png")
	var seven = preload("res://kenney_tiny-ski/Tiles/tile_0091.png")
	var eight = preload("res://kenney_tiny-ski/Tiles/tile_0092.png")
	var nine = preload("res://kenney_tiny-ski/Tiles/tile_0093.png")
	var temp = value
	var digit
	for child in $Score.get_children():
		child.queue_free()
	while(temp):
		digit = temp % 10
		if digit==0:
			zero.position = startPosition
			$Score.add_child(zero, true)
		if digit==1:
			$Score.add_child(one, true)
			one.position = startPosition
		if digit==2:
			$Score.add_child(two, true)
			two.position = startPosition
		if digit==3:
			$Score.add_child(three, true)
			three.position = startPosition
		if digit==4:
			$Score.add_child(four, true)
			four.position = startPosition
		if digit==5:
			$Score.add_child(five, true)
			five.position = startPosition
		if digit==6:
			$Score.add_child(six, true)
			six.position = startPosition
		if digit==7:
			$Score.add_child(seven, true)
			seven.position = startPosition
		if digit==8:
			$Score.add_child(eight, true)
			eight.position = startPosition
		if digit==9:
			$Score.add_child(nine, true)
			nine.position = startPosition
		temp /= 10;
		startPosition.x -= 30
