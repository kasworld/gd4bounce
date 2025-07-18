extends RigidBody3D
class_name Dice

signal brick_broken(me :RigidBody3D, br :Brick)

func init(vel :Vector3, avel :Vector3) -> Dice:
	linear_velocity = vel
	angular_velocity = avel
	return self

func set_material(mat :Material) -> Dice:
	$MeshInstance3D.mesh.material = mat
	return self

func set_color(co :Color) -> Dice:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func get_color() -> Color:
	return $MeshInstance3D.mesh.material.albedo_color

func set_size(v3 :Vector3) -> Dice:
	$MeshInstance3D.mesh.size = v3
	$CollisionShape3D.shape.size = v3
	return self

func _on_body_entered(body: Node) -> void:
	if body is Brick:
		brick_broken.emit(self,body)
	elif body is Wall:
		pass
