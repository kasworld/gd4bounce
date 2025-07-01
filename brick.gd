extends StaticBody3D

class_name Brick

func set_color(co :Color) -> Brick:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_size(v3 :Vector3) -> Brick:
	$MeshInstance3D.mesh.size = v3
	$CollisionShape3D.shape.size = v3
	return self
