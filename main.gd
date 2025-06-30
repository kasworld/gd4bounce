extends Node3D

func _ready() -> void:
	for i in 50:
		var b = add_ball()
		add_child(b)

	for i in 50:
		var b = add_capsule()
		add_child(b)

	for i in 50:
		var b = add_coin()
		add_child(b)

	for i in 50:
		var b = add_dice()
		add_child(b)

	for i in 50:
		var b = add_char("%s" % i)
		add_child(b)

	
func add_ball() -> Ball:
	var rtn = preload("res://ball.tscn").instantiate()
	rtn.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	rtn.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return rtn

func add_capsule() -> Capsule:
	var rtn = preload("res://capsule.tscn").instantiate()
	rtn.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	rtn.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return rtn

func add_coin() -> Coin:
	var rtn = preload("res://coin.tscn").instantiate()
	rtn.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	rtn.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return rtn

func add_dice() -> Dice:
	var rtn = preload("res://dice.tscn").instantiate()
	rtn.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	rtn.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return rtn

func add_char(s :String) -> Char:
	var rtn = preload("res://char.tscn").instantiate().init(s)
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
