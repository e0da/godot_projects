extends Node2D

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen