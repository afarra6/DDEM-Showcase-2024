extends StateMachineState

@export var enemy : CharacterBody2D
@export var sprite : AnimatedSprite2D
@export var timer : Timer
@export var jump_power := 500

# Called when the state machine enters this state.
func on_enter():
	sprite.play("idle")
	timer.wait_time = randi_range(1, 4)
	timer.start()
	enemy.velocity = Vector2.ZERO
	pass


# Called every frame when this state is active.
func on_process(delta):
	
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



func _on_timer_timeout():
	
	if get_parent().current_state.name != "Hurt":
		var state_to_change_to = ["Run", "Jump"][randi_range(0,1)]
		if state_to_change_to == "Run":
			change_state(state_to_change_to)
		else:
			#enemy.velocity.y = jump_power
			change_state(state_to_change_to)
		print(state_to_change_to)
	
	pass # Replace with function body.
