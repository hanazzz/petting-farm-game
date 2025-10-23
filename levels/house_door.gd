extends TileMapLayer

@onready var interactable: Area2D = $Interactable
# Get open door map layer
@onready var house_door_open: TileMapLayer = $"../HouseDoorOpen"
# Get roof map layer
@onready var house_roof: TileMapLayer = $"../HouseRoof"

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
		# Hide closed door map layer
		hide()
		# Show open door map layer
		house_door_open.show()
		# Disable collisions on closed door map layer
		collision_enabled = false
		# Hide roof
		house_roof.hide()
		# Update door state
		is_door_closed = false
		# Update door interaction name
		$Interactable.interact_name = "Close door"
	# If door is open, close it
	else:
		# Show closed door map layer
		show()
		# Hide open door map layer
		house_door_open.hide()
		# Enable collisions on closed door map layer
		collision_enabled = true
		# Show roof
		house_roof.show()
		# Update door state
		is_door_closed = true
		# Update door interaction name
		$Interactable.interact_name = "Open door"
