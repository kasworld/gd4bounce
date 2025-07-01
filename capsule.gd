extends RigidBody3D

class_name Capsule

func set_color(co :Color) -> Capsule:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_radius_height(r :float, h:float) -> Capsule:
	$MeshInstance3D.mesh.radius = r
	$MeshInstance3D.mesh.height = h
	$CollisionShape3D.shape.radius = r
	$CollisionShape3D.shape.height = h
	return self

func _on_body_entered(body: Node) -> void:
	if body is Brick:
		body.set_color($MeshInstance3D.mesh.material.albedo_color)
