extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Tile0033.texture = load("res://kenney_tiny-ski/Tiles/tile_0032.png")
	$Tile0032.texture = load("res://kenney_tiny-ski/Tiles/tile_0032.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gate_score_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	$Tile0033.texture = load("res://kenney_tiny-ski/Tiles/tile_0033.png")
	$Tile0032.texture = load("res://kenney_tiny-ski/Tiles/tile_0033.png")
	pass # Replace with function body.
