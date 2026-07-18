extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(position)
	pass



func _on_area_entered(area: Area2D) -> void:
	if Global.playerState==1:
		$Sprite2D.scale.y = .2
		$CollisionShape2D.disabled = true
