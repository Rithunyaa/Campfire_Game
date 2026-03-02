extends Area2D

const LAB_SCENE = "res://Ending.tscn"  # ⚠️ Replace with your real lab scene path

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file(LAB_SCENE)
