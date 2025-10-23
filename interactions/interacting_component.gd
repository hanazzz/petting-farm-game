extends Node2D

# Get label for interaction
@onready var interact_label: Label = $InteractLabel

# List of all available interactions
var current_interactions : Array = []
# Track whether player is able to interact with things
var can_interact : bool = true


func _input(_event: InputEvent) -> void:
	# Check if player pressed interact button while able to interact
	if Input.is_action_pressed("interact") and can_interact:
		# Check if there is an available interaction
		if current_interactions:
			# Prevent player from continuing to interact
			can_interact = false
			# Hide interaction label
			interact_label.hide()
			# Start object's interaction (stored on interact property)
			# Wait until it finishes before continuing
			await current_interactions[0].interact.call()
			# After interaction is done, player can interact again
			can_interact = true


func _process(_delta: float) -> void:
	# If there are available interactions and player can interact
	if current_interactions and can_interact:
		# Sort list of available interactions by distance to player
		# (closest interaction is first)
		current_interactions.sort_custom(_sort_by_distance_to_player)
		# Check if closest interaction can be interacted with
		if current_interactions[0].is_interactable:
			# Use interaction's name as label text, show label
			interact_label.text = current_interactions[0].interact_name
			interact_label.show()
	# If there aren't any available interactions or the player can't interact
	# hide interact label
	else:
		interact_label.hide()


# Sort areas by their distance to the player (from closest to furthest)
func _sort_by_distance_to_player(area1, area2):
	# Get distance between first area and player
	var area1_to_player = global_position.distance_to(area1.global_position)
	# Get distance between second area and player
	var area2_to_player = global_position.distance_to(area2.global_position)
	# Return true if first area is closer
	# Return false if second area is closer
	if area1_to_player < area2_to_player:
		return true
	else:
		return false
	

func _on_interact_range_area_entered(area: Area2D) -> void:
	# When interactable enters player's range of interaction (InteractRange)
	# Add encountered interactable (area) to list of available interactions.
	current_interactions.push_back(area)


func _on_interact_range_area_exited(area: Area2D) -> void:
	# When interactable no longer in player's range of interaction (InteractRange)
	# Remove interactable (area) from list of available interactions.
	current_interactions.erase(area)
