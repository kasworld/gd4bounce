extends StaticBody3D
class_name Brick

func set_material(mat :Material) -> Brick:
	$MeshInstance3D.mesh.material = mat
	return self

func set_color(co :Color) -> Brick:
	$MeshInstance3D.mesh.material.albedo_color = Color(co, 0.5)
	return self

func get_color() -> Color:
	return $MeshInstance3D.mesh.material.albedo_color

func set_size(v3 :Vector3) -> Brick:
	$MeshInstance3D.mesh.size = v3
	$CollisionShape3D.shape.size = v3
	return self
