extends Node3D

class_name Ball

func _ready() -> void:
	$MeshInstance3D.mesh.material.albedo_color = NamedColorList.color_list.pick_random()[0]
