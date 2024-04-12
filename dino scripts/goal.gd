extends Area2D

var open = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.name)
	if body.name == "Player" and !open:
		
		$AnimatedSprite2D.play("open")
		open = true
		
		body.find_child("Camera2D").get_child(0).visible = true
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	
	$GPUParticles2D.emitting = true
	pass # Replace with function body.
