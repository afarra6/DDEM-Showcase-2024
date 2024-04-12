extends CharacterBody2D


@export var speed = 300.0
@export var jump_power = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


func _on_area_2d_body_entered(body):
	#
	#if body.name == "Player" and body.find_child("FiniteStateMachine").current_state.name != "Hurt":
		#body.find_child("FiniteStateMachine").change_state("Hurt")
		#body.velocity = (body.position - position + Vector2(0, -100)).normalized() * 100
	#
	pass # Replace with function body.
