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
	# If door is closed, open it
	if is_door_closed == true:
		# Hide roof
		house_roof.hide()
		# Play opening animation
		$AnimatedSprite2D.play("opening")
		# Disable collision layer
		$ClosedCollisionShape2D.set_disabled(true)
		# Update door state
		is_door_closed = false
		# Update door interaction name
		$Interactable.interact_name = "Close door"
	# If door is open, close it
	else:
		# Play closing animation
		$AnimatedSprite2D.play("closing")
		# Enable collision layer
		$ClosedCollisionShape2D.set_disabled(false)
		# Update door state
		is_door_closed = true
		# Show roof
		house_roof.show()
		# Update door interaction name
		$Interactable.interact_name = "Open door"
