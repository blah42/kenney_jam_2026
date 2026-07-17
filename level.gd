extends Node2D

<<<<<<< HEAD
var map_speed = 200 
const screen_height = 9*16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var character = preload("res://Skiier.tscn").instantiate()
	$Player.add_child(character, true)
=======

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
>>>>>>> 2e76541 (updated character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
<<<<<<< HEAD
	mapMove(map_speed,delta)
	pass
func mapMove(speed,delta):
	
	$Map.move_local_y(-delta*speed)
	if($Map/MapSegment0.global_position.y < -150*2):
		$Map/MapSegment0.move_local_y(screen_height*5)
	if($Map/MapSegment1.global_position.y < -150*2): 
		$Map/MapSegment1.move_local_y(screen_height*5)
	if($Map/MapSegment2.global_position.y < -150*2):
		$Map/MapSegment2.move_local_y(screen_height*5)
	if($Map/MapSegment3.global_position.y < -150*2): 
		$Map/MapSegment3.move_local_y(screen_height*5)
	if($Map/MapSegment4.global_position.y < -150*2): 
		$Map/MapSegment4.move_local_y(screen_height*5)
=======
	pass
>>>>>>> 2e76541 (updated character)
