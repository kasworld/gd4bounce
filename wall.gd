extends StaticBody3D

class_name Wall

func _ready() -> void:
	set_color(NamedColorList.color_list.pick_random()[0])

func set_color(co :Color) -> Wall:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
