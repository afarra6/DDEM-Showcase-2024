extends CharacterBody2D


@export var speed = 150.0
@export var jump_power = 400.0
@export var health = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$"Camera2D/win screen".visible = false
	$"Camera2D/lose screen".visible = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		$Camera2D.offset.x = lerp($Camera2D.offset.x, 50.0, 0.02)
	elif direction < 0:
		$Camera2D.offset.x = lerp($Camera2D.offset.x, -50.0, 0.02)
	else:
		$Camera2D.offset.x = lerp($Camera2D.offset.x, 0.0, 0.02)
	
	if velocity.y < -100:
		$Camera2D.offset.y = lerp($Camera2D.offset.y, 0.0, 0.03)
	else:
		$Camera2D.offset.y = lerp($Camera2D.offset.y, -80.0, 0.03)
		
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	
	if body is CharacterBody2D:
		velocity.y = -jump_power
		if body.find_child("FiniteStateMachine").current_state.name != "Hurt":
			body.find_child("FiniteStateMachine").change_state("Hurt")
		
	pass # Replace with function body.


func _on_hurt_box_body_entered(body):
	
	print(body.get_groups())
	
	if body.get_groups().has("dino") and $FiniteStateMachine.current_state.name != "Hurt":
		$FiniteStateMachine.change_state("Hurt")
		velocity = (position - body.position  + Vector2(0, -100)).normalized() * 100
		
	
	
	pass # Replace with function body.
