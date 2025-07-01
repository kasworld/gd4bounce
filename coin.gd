extends RigidBody3D

class_name Coin

func init(n :int) -> Coin:
	$MeshInstance3D.mesh.radial_segments = n
	return self

func set_color(co :Color) -> Coin:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_radius_height(r :float, h:float) -> Coin:
	$MeshInstance3D.mesh.top_radius = r
	$MeshInstance3D.mesh.bottom_radius = r
	$MeshInstance3D.mesh.height = h
	$CollisionShape3D.shape.radius = r
	$CollisionShape3D.shape.height = h
	return self

func _on_body_entered(body: Node) -> void:
	if body is Brick:
		body.set_color($MeshInstance3D.mesh.material.albedo_color)
