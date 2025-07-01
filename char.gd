extends RigidBody3D

class_name Char

func set_color(co :Color) -> Char:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_height_depth(h :float, d :float) -> Char:
	$MeshInstance3D.mesh.depth = d
	$CollisionShape3D.shape.size.y = d
	$CollisionShape3D.shape.size.z = h
	$MeshInstance3D.mesh.pixel_size = h/10
	$CollisionShape3D.shape.size.x = $CollisionShape3D.shape.size.z * 0.9 * $MeshInstance3D.mesh.text.length() 
	return self

func set_char(s :String) -> Char:
	$MeshInstance3D.mesh.text = s
	$CollisionShape3D.shape.size.x = $CollisionShape3D.shape.size.z * 0.9 * $MeshInstance3D.mesh.text.length() 
	return self

func random_color() -> Color:
	return NamedColorList.color_list.pick_random()[0]

func _on_body_entered(body: Node) -> void:
	if body is Brick:
		body.set_color(random_color())
