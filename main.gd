extends Node3D

func _ready() -> void:
	for i in 100:
		var b = add_ball()
		add_child(b)
	
func add_ball() -> Ball:
	var rtn = preload("res://ball.tscn").instantiate()
	rtn.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	rtn.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return rtn

var key2fn = {
	KEY_ESCAPE:_on_button_esc_pressed,
}
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var fn = key2fn.get(event.keycode)
		if fn != null:
			fn.call()
	elif event is InputEventMouseButton and event.is_pressed():
		pass

func _on_button_esc_pressed() -> void:
	get_tree().quit()
