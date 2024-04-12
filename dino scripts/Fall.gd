extends StateMachineState

@export var player : CharacterBody2D
@export var sprite : AnimatedSprite2D


# Called when the state machine enters this state.
func on_enter():
	sprite.play("fall")
	pass


# Called every frame when this state is active.
func on_process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		sprite.flip_h = false
		
	elif direction < 0:
		sprite.flip_h = true
		
	player.velocity.x = direction * player.speed
	if player.is_on_floor():
		change_state("Idle")
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

