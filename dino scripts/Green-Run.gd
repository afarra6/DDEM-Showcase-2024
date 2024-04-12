extends StateMachineState

@export var enemy : CharacterBody2D
@export var sprite : AnimatedSprite2D

var run_time = 3
# Called when the state machine enters this state.
func on_enter():
	sprite.play("run")
	
	var direction = [-1,1][randi_range(0,1)]
	
	enemy.velocity.x = direction * enemy.speed
	if direction == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	
	
	
	
	run_time = randi_range(3,6)
	
	pass


# Called every frame when this state is active.
func on_process(delta):
	run_time -= delta
	if run_time <= 0:
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

