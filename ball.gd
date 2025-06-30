extends RigidBody3D

class_name Ball

var tex_array = [
	preload("res://BallTexture/ball1.tres"),	
	preload("res://BallTexture/ball2.tres"),	
	preload("res://BallTexture/ball3.tres"),	
	preload("res://BallTexture/ball4.tres"),	
	preload("res://BallTexture/ball5.tres"),	
	preload("res://BallTexture/ball6.tres"),	
	preload("res://BallTexture/ball7.tres"),	
	preload("res://BallTexture/ball8.tres"),	
	preload("res://BallTexture/ball9.tres"),	
	preload("res://BallTexture/ball10.tres"),	
	preload("res://BallTexture/ball11.tres"),	
	preload("res://BallTexture/ball12.tres"),	
	preload("res://BallTexture/ball13.tres"),	
	preload("res://BallTexture/ball14.tres"),	
	preload("res://BallTexture/ball15.tres"),	
]

func _ready() -> void:
	$MeshInstance3D.mesh.material = tex_array.pick_random()
	#var co = NamedColorList.color_list.pick_random()[0]
	#$MeshInstance3D.mesh.material.albedo_color = co #Color(co, 0.5)
