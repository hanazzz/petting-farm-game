extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var house_roof: TileMapLayer = %HouseRoof
@onready var closed_collision_shape_2d: CollisionShape2D = $ClosedCollisionShape2D

var is_door_closed : bool = true


func _ready() -> void:
	# Set door's interaction function
	$Interactable.interact = _on_interact
	# Set initial door interaction name depending on door state
	if is_door_closed == true:
		$Interactable.interact_name = "Open door"
	else:
		$Interactable.interact_name = "Close door"


func _on_interact():
	# Check if door is available for interaction
	if $Interactable.is_interactable == true:
		# If door is closed, open it
		if is_door_closed == true:
			open_door()
		# If door is open, close it
		else:
			close_door()
	else:
		return


## Open the door to a building
func open_door() -> void:
	# Temporarily disable interaction until current one finished
	$Interactable.is_interactable = false
	
	# Hide roof
	house_roof.hide()
	# Play opening animation
	$AnimatedSprite2D.play("opening")
	# Update door state
	is_door_closed = false
	# Update door interaction name
	$Interactable.interact_name = "Close door"
	
	# Wait until animation finishes before
	# letting player through and re-enabling door interaction
	await $AnimatedSprite2D.animation_finished
	# Disable collision layer in middle of door
	# (So player can pass through)
	$ClosedCollisionShape2D.set_disabled(true)
	$Interactable.is_interactable = true
	


## Close the door to a building
func close_door() -> void:
	# Temporarily disable interaction until current one finished
	$Interactable.is_interactable = false
	
	# Play door closing animation
	$AnimatedSprite2D.play("closing")
	# Enable collision layer in middle of door
	# (So player can't pass through)
	$ClosedCollisionShape2D.set_disabled(false)
	# Update door state
	is_door_closed = true
	# Show roof
	house_roof.show()
	# Update door interaction name
	$Interactable.interact_name = "Open door"
	
	# Wait until animation finishes before re-enabling door interaction
	await $AnimatedSprite2D.animation_finished
	$Interactable.is_interactable = true
