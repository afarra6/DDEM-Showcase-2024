extends StateMachineState

@export var enemy : CharacterBody2D
@export var sprite : AnimatedSprite2D
var death_clock = 0

# Called when the state machine enters this state.
func on_enter():
	
	sprite.reparent(enemy.get_tree().get_root().find_child("main"))
	sprite.play("hurt")
	enemy.collision_layer = 0
	pass


# Called every frame when this state is active.
func on_process(delta):
	death_clock += delta
	if death_clock >= 1:
		enemy.queue_free()
	pass


# Called every physics frame when this state is active.
func on_physics_process(delta):
	pass


# Called when there is an input event while this state is active.
func on_input(event: InputEvent):
	pass


# Called when the state machine exits this state.
func on_exit():
	pass



func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "hurt":
		enemy.queue_free()
		sprite.queue_free()
	pass # Replace with function body.
