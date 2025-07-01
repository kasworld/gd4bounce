extends Node3D

func _ready() -> void:
	var deck = PlayingCard.make_deck_with_joker()
	var n = 1
	for i in n:
		add_child(rand_pos_rot(
			preload("res://ball.tscn").instantiate(
			).set_material(Ball.tex_array.pick_random()
			).set_radius(randf_range(0.2,1)
		)))
		add_child(rand_pos_rot(
			preload("res://capsule.tscn").instantiate(
			).set_color(random_color()
			).set_radius_height(	randf_range(0.2,1), randf_range(0.6,3)
		)))
		add_child(rand_pos_rot(
			preload("res://coin.tscn").instantiate(
			).init( i%8 +4
			).set_color(random_color()
			).set_radius_height(randf_range(0.2,1), randf_range(0.04,0.2)
		)))
		add_child(rand_pos_rot(
			preload("res://dice.tscn").instantiate(
			).set_color(random_color()
			).set_size(Vector3( randf_range(0.4,2),randf_range(0.4,2),randf_range(0.4,2) )
		)))
		add_child(rand_pos_rot(
			preload("res://char.tscn").instantiate(
			).set_char(deck.pick_random()
			).set_color(random_color()
			).set_height_depth(randf_range(0.5,2),randf_range(0.01,0.3)
		)))

	for x in range(-9,10):
		for y in range(-9,0):
			for z in range(-9,10):
				if randi_range(0,100) != 0:
					continue
				var br = preload("res://brick.tscn").instantiate(
					).set_color(random_color()
					).set_size(Vector3(0.9,0.9,0.9))
				br.position = Vector3(x,y,z)
				add_child(br)

func rand_pos_rot(n :Node3D) -> Node3D:
	n.position = Vector3(randf_range(-9,9),randf_range(-8,9),randf_range(-9,9))
	n.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return n

func random_color() -> Color:
	return NamedColorList.color_list.pick_random()[0]

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
