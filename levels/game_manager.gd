extends Node

# Access points label
@onready var points_label: Label = %PointsLabel

# Start player with zero points
var player_points : int = 0


# Increase player points
func add_points(points: int):
	# Update points
	player_points += points
	print(player_points)
	# Update points label
	%PointsLabel.text = "Points: " + str(player_points)
