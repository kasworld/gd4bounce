extends StaticBody3D

func _ready() -> void:
	$MeshInstance3D.mesh.material.albedo_color = NamedColorList.color_list.pick_random()[0]
