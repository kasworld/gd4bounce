extends RigidBody3D

class_name Char

func init(ch :String) -> Char:
	$MeshInstance3D.mesh.text = ch
	$CollisionShape3D.shape.size.x = 0.9* ch.length() 
	return self

func set_color(co :Color) -> Char:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
