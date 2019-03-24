extends Area2D

func _physics_process(_delta):
	var justin = get_node("/root/World/Justin")
	$Heart.visible = overlaps_body(justin)
	