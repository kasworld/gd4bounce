extends RigidBody3D

class_name Char

func init(ch :String) -> Char:
	$MeshInstance3D.mesh.text = ch
	return self

func _ready() -> void:
	var co = NamedColorList.color_list.pick_random()[0]
	$MeshInstance3D.mesh.material.albedo_color = co #Color(co, 0.5)
