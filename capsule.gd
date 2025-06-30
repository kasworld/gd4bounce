extends RigidBody3D

class_name Capsule

func set_color(co :Color) -> Capsule:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
