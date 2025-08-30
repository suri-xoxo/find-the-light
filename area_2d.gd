# This script is attached to an Area2D node.
# It handles what happens when a body enters the Area2D.

extends Area2D

# The @onready keyword ensures the variable is initialized when the node is added to the scene.
@onready var canvas_modulate: CanvasModulate = %CanvasModulate
@onready var point_light_2d: PointLight2D = %PointLight2D
@onready var camera_2d: Camera2D = %Camera2D


func _on_body_entered(body: Node2D) -> void:
# Connect the body_entered signal from the Area2D in your scene to this function.

	# Check if the entered body is the "Frog" node.
	if body.name == "Frog":
		# Create a single Tween to handle all three effects.
		var tween: Tween = create_tween()
		
		# Fade the `CanvasModulate` node's alpha to 0.
		if canvas_modulate:
			tween.tween_property(canvas_modulate, "color:a", 0.0, 0.5)
		
		# Fade the `PointLight2D` node's energy to 0.
		if point_light_2d:
			tween.tween_property(point_light_2d, "energy", 0.0, 0.5)
		
		# Zoom out the `Camera2D`. The `Vector2(1.5, 1.5)` will zoom out by 50%.
		# You can adjust this value to control how far it zooms.
		if camera_2d:
			tween.tween_property(camera_2d, "zoom", Vector2(1.5, 1.5), 0.5)
			
		# Await the completion of the tween before freeing the node.
		# This ensures all three effects have fully completed.
		await tween.finished
		
		# Remove this node from the scene tree, effectively destroying the collectible.
		queue_free()
