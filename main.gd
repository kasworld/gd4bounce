extends Node3D

var tex_array = [
	preload("res://BallTexture/ball1.tres"),	
	preload("res://BallTexture/ball2.tres"),	
	preload("res://BallTexture/ball3.tres"),	
	preload("res://BallTexture/ball4.tres"),	
	preload("res://BallTexture/ball5.tres"),	
	preload("res://BallTexture/ball6.tres"),	
	preload("res://BallTexture/ball7.tres"),	
	preload("res://BallTexture/ball8.tres"),	
	preload("res://BallTexture/ball9.tres"),	
	preload("res://BallTexture/ball10.tres"),	
	preload("res://BallTexture/ball11.tres"),	
	preload("res://BallTexture/ball12.tres"),	
	preload("res://BallTexture/ball13.tres"),	
	preload("res://BallTexture/ball14.tres"),	
	preload("res://BallTexture/ball15.tres"),	
]

var total_brick_count :int
func _ready() -> void:
	var vp_size = get_viewport().get_visible_rect().size
	var 짧은길이 = min(vp_size.x,vp_size.y)
	$"왼쪽패널".size = Vector2(vp_size.x/2 - 짧은길이/2, vp_size.y)

	reset_camera_pos()
	add_bricks()
	add_moveings()
	
func add_moveings() -> void:
	var deck = PlayingCard.make_deck_with_joker()
	var n = 10
	for i in n:
		$MovingContainer.add_child(rand_pos_rot(
			preload("res://ball.tscn").instantiate(
			).init(rand_vector3(10).normalized()*20,rand_vector3(PI)
			#).set_color(random_color()
			).set_material(tex_array.pick_random()
			).set_radius(randf_range(0.2,0.5)
		)))
		#$MovingContainer.add_child(rand_pos_rot(
			#preload("res://capsule.tscn").instantiate(
			#).init(rand_vector3(10).normalized()*30,Vector3.ZERO
			#).set_color(random_color()
			#).set_radius_height(	randf_range(0.2,0.5), randf_range(0.5,2)
		#)))
		#$MovingContainer.add_child(rand_pos_rot(
			#preload("res://coin.tscn").instantiate(
			#).init(rand_vector3(10).normalized()*30,Vector3.ZERO
			#).set_segment( i%8 +4
			#).set_color(random_color()
			#).set_radius_height(randf_range(0.2,0.7), randf_range(0.05,0.2)
		#)))
		#$MovingContainer.add_child(rand_pos_rot(
			#preload("res://dice.tscn").instantiate(
			#).init(rand_vector3(10).normalized()*30,Vector3.ZERO
			#).set_color(random_color()
			#).set_size(Vector3( randf_range(0.5,1),randf_range(0.5,1),randf_range(0.5,1) )
		#)))
		#$MovingContainer.add_child(rand_pos_rot(
			#preload("res://char.tscn").instantiate(
			#).init(rand_vector3(10).normalized()*30,Vector3.ZERO
			#).set_char(deck.pick_random()
			#).set_color(random_color()
			#).set_height_depth(randf_range(0.5,1),randf_range(0.05,0.2)
		#)))
	for mv in $MovingContainer.get_children():
		mv.brick_broken.connect(brick_broken)

func add_bricks() -> void:
	for x in range(-9,10):
		for y in range(-9,0):
			for z in range(-9,10):
				if randi_range(0,1) != 0:
					continue
				var br = preload("res://brick.tscn").instantiate(
					).set_color(random_color()
					).set_size(Vector3(0.9,0.9,0.9))
				br.position = Vector3(x,y,z)
				$BrickContainer.add_child(br)
	total_brick_count = $BrickContainer.get_child_count()
	update_brick_count()

func reset_movings_pos_rot() -> void:
	for mv in $MovingContainer.get_children():
		rand_pos_rot(mv)

func brick_broken(me :RigidBody3D, br :Brick) ->void:
	br.set_broken_effect()
	br.reparent($BrokenBrickContainer)
	if $BrickContainer.get_child_count() <= 0:
		reset_movings_pos_rot.call_deferred()
		add_bricks.call_deferred()
	update_brick_count()

func update_brick_count() -> void:
	$"왼쪽패널/BrickCount".text = "%s/%s" % [$BrickContainer.get_child_count() , total_brick_count]

func rand_pos_rot(n :Node3D) -> Node3D:
	n.position = Vector3(randf_range(-9,9),randf_range(0,9),randf_range(-9,9))
	n.rotation = Vector3(randf_range(-PI,PI),randf_range(-PI,PI),randf_range(-PI,PI))
	return n

func rand_vector3(m :float) -> Vector3:
	return Vector3(randf_range(-m,m),randf_range(-m,m),randf_range(-m,m))

func random_color() -> Color:
	return NamedColorList.color_list.pick_random()[0]

var key2fn = {
	KEY_ESCAPE:_on_button_esc_pressed,
	KEY_ENTER:_on_카메라변경_pressed,
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

var camera_move = true
func _process(delta: float) -> void:
	var t = Time.get_unix_time_from_system() /-3.0
	if camera_move:
		$Camera3D.position = Vector3(sin(t)*10, sin(t)*5+5, cos(t)*10)
		$Camera3D.look_at(Vector3.ZERO)

func _on_카메라변경_pressed() -> void:
	camera_move = !camera_move
	if camera_move == false:
		reset_camera_pos()

func reset_camera_pos()->void:
	$Camera3D.position = Vector3(1,10,0)
	$Camera3D.look_at(Vector3.ZERO)
	$Camera3D.far = 50
