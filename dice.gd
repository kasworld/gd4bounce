extends RigidBody3D

class_name Dice

func set_color(co :Color) -> Dice:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
