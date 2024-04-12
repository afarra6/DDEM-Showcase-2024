extends StateMachineState

@export var player : CharacterBody2D
@export var sprite : AnimatedSprite2D

# Called when the state machine enters this state.
func on_enter():
	sprite.play("lose")
	$"../../HitBox".monitoring = false
	$"../../HurtBox".monitoring = false
	$"../../Camera2D/lose screen".visible = true
	player.velocity = Vector2.ZERO
	player.collision_layer = 0
	pass


# Called every frame when this state is active.
func on_process(delta):
	player.velocity = Vector2.ZERO
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

