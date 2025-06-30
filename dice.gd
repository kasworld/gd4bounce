extends RigidBody3D

class_name Dice

func set_color(co :Color) -> Dice:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_size(v3 :Vector3) -> Dice:
	$MeshInstance3D.mesh.size = v3
	$CollisionShape3D.shape.size = v3
	return self
