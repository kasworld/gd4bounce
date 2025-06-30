extends RigidBody3D

class_name Ball

static var tex_array = [
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

func set_material(mat :Material) -> Ball:
	$MeshInstance3D.mesh.material = mat
	return self

func set_color(co :Color) -> Ball:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func set_radius(r :float) -> Ball:
	$MeshInstance3D.mesh.radius = r
	$MeshInstance3D.mesh.height = r*2
	$CollisionShape3D.shape.radius = r
	return self
