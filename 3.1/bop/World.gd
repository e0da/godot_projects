extends Node2D

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		var hidden = Input.MOUSE_MODE_HIDDEN
		var shown = Input.MOUSE_MODE_VISIBLE
		var current_mode = Input.get_mouse_mode()
		var mouse_mode = hidden if current_mode == shown else shown
		Input.set_mouse_mode(mouse_mode)
