extends Area2D

func _ready():
	# Connect the 'body_entered' signal correctly using Callable
	self.body_entered.connect(Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	# Check if the colliding object is your player
	if body is CharacterBody2D:
		# Restart the current scene
		get_tree().reload_current_scene()
