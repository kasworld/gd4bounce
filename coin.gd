extends RigidBody3D

class_name Coin

func init(n :int) -> Coin:
	$MeshInstance3D.mesh.radial_segments = n
	return self


func _ready() -> void:
	var co = NamedColorList.color_list.pick_random()[0]
	$MeshInstance3D.mesh.material.albedo_color = co #Color(co, 0.5)
