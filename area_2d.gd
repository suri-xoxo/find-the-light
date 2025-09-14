extends Area2D

@onready var canvas_modulate: CanvasModulate = %CanvasModulate
@onready var point_light_2d: PointLight2D = %PointLight2D
@onready var camera_2d: Camera2D = %Camera2D

func _on_body_entered(body: Node2D) -> void:

	if body.name == "Frog":
		var tween: Tween = create_tween()

		if canvas_modulate:
			tween.tween_property(canvas_modulate, "color:a", 0.0, 0.5)
		if point_light_2d:
			tween.tween_property(point_light_2d, "energy", 0.0, 0.5)
		if camera_2d:
			tween.tween_property(camera_2d, "zoom", Vector2(1.5, 1.5), 0.5)
			
		await tween.finished
		queue_free()
