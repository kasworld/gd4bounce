extends Node3D

func _ready() -> void:
	var deck = PlayingCard.make_deck_with_joker()
	var n = 10

	for i in n:
		var rtn = preload("res://ball.tscn").instantiate().set_material(Ball.tex_array.pick_random())
		rand_pos_rot(rtn)
		add_child(rtn)

	for i in n:
		var rtn = preload("res://capsule.tscn").instantiate().set_color(NamedColorList.color_list.pick_random()[0])
		rand_pos_rot(rtn)
		add_child(rtn)

	for i in n:
		var rtn = preload("res://coin.tscn").instantiate().init( i%8 +4).set_color(NamedColorList.color_list.pick_random()[0])
		rand_pos_rot(rtn)
		add_child(rtn)

	for i in n:
		var rtn = preload("res://dice.tscn").instantiate().set_color(NamedColorList.color_list.pick_random()[0])
		rand_pos_rot(rtn)
		add_child(rtn)

	for i in n:
		var rtn = preload("res://char.tscn").instantiate().init(deck.pick_random()).set_color(NamedColorList.color_list.pick_random()[0])
		rand_pos_rot(rtn)
		add_child(rtn)

func rand_pos_rot(n :Node3D) -> void:
	n.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	n.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))

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
