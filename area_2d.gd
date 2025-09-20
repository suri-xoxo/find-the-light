extends Area2D

@onready var canvas_modulate: CanvasModulate = %CanvasModulate
@onready var point_light_2d: PointLight2D = %PointLight2D
@onready var camera_2d: Camera2D = %Camera2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Frog":
		if canvas_modulate:
			canvas_modulate.color.a = 0.0
		if point_light_2d:
			point_light_2d.energy = 0.0
		if camera_2d:
			camera_2d.zoom = Vector2(1.5, 1.5)
		
		queue_free()
