extends RigidBody3D

class_name Coin

func init(n :int) -> Coin:
	$MeshInstance3D.mesh.radial_segments = n
	return self

func set_color(co :Color) -> Coin:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
