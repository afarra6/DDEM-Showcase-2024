extends StateMachineState

@export var player : CharacterBody2D
@export var sprite : AnimatedSprite2D


# Called when the state machine enters this state.
func on_enter():
	sprite.play("hurt")
	player.health -= 1
	if player.health <= 0:
		change_state("Lose")
	$"../../HitBox".monitoring = false
	pass


# Called every frame when this state is active.
func on_process(delta):
	
	player.velocity = lerp(player.velocity, Vector2.ZERO, 0.1)
	pass


# Called every physics frame when this state is active.
func on_physics_process(delta):
	pass


# Called when there is an input event while this state is active.
func on_input(event: InputEvent):
	pass


# Called when the state machine exits this state.
func on_exit():
	$"../../HitBox".monitoring = true
	pass



func _on_animated_sprite_2d_animation_finished():
	
	if sprite.animation == "hurt":
		change_state("Idle")
	
	pass # Replace with function body.
