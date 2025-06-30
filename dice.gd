extends RigidBody3D

class_name Dice


func _ready() -> void:
	var co = NamedColorList.color_list.pick_random()[0]
	$MeshInstance3D.mesh.material.albedo_color = co #Color(co, 0.5)
