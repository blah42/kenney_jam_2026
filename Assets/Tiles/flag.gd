extends Node2D

signal flag_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = "res://kenney_tiny-ski/Tiles/tile_0021.png"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if( =  ): #id of the skier
		flag_hit.emit();
		$Sprite2D.texture = "res://kenney_tiny-ski/Tiles/tile_0021.png"
