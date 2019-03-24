extends Node2D

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()