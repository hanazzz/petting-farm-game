extends CharacterBody2D

enum COW_STATE { IDLE, WALK }
# Get referemce interactable node
@onready var interactable: Area2D = $Interactable

# Set cow's move speed
@export var move_speed : float = 20
# Set length of time for idle state
@export var idle_time : float = 5
# Set duration of time for walk state
@export var walk_time : float = 2

# Get access to AnimationTree
@onready var animation_tree: AnimationTree = $AnimationTree
# Get access to state machine within AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
# Get access to Sprite2D
@onready var sprite: Sprite2D = $Sprite2D
# Get access to Timer node
@onready var timer: Timer = $Timer
# Get access to animated heart node
@onready var heart: Node2D = $Heart

# Set initial move direction
var move_direction : Vector2 = Vector2.ZERO
# Set initial default state
var current_state : COW_STATE = COW_STATE.IDLE

func _ready() -> void:
	pick_new_state()
	# Set cow's interaction function
	$Interactable.interact = _on_interact
	# Set idle and walk timers
	set_timers()


func _on_interact():
	# Show heart above cow
	heart.show()
	# Make cow unavailable for interaction
	$Interactable.is_interactable = false


func _physics_process(delta: float) -> void:
	# Move only if cow state is walk
	if (current_state == COW_STATE.WALK):
		velocity = move_direction * move_speed
		
		move_and_slide()


# Randomly generate a new move direction
# x and y can be -1, 0, or 1
func select_new_direction():
	# Normalize so that diagonal movement isn't faster
	move_direction = Vector2(
		randi_range(-1, 1),
		randi_range(-1, 1)
	).normalized()
	
	# Make animation sprite face movement direction
	# Cow sprite faces right by default
	# If moving left, flip sprite on horizontal acis
	if (move_direction.x < 0):
		sprite.flip_h = true
	# If moving right, don't flip
	elif (move_direction.x > 0):
		sprite.flip_h = false
	# If move_direction is x, then direction hasn't changed and sprite doesn't need to flip

# Switch state between idle and walking
func pick_new_state():
	# If idling, switch to walking state and select  direction
	if (current_state == COW_STATE.IDLE):
		current_state = COW_STATE.WALK
		# Hide heart
		heart.hide()
		# Make cow uninteractable
		$Interactable.is_interactable = false
		state_machine.travel("Walk")
		select_new_direction()
		# Start timer
		timer.start(walk_time)
	# If currently walking, switch to idling state
	elif (current_state == COW_STATE.WALK):
		current_state = COW_STATE.IDLE
		state_machine.travel("Idle")
		# Make cow interactable again
		$Interactable.is_interactable = true
		timer.start(idle_time)


# When timer for current state ends, pick new state
func _on_timer_timeout() -> void:
	pick_new_state()


# Randomly select times for idle and walk time
func set_timers():
	idle_time = randf_range(4,8)
	# Set duration of time for walk state
	walk_time = randf_range(1,2)
