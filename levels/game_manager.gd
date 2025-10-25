extends Node

# Access points label
@onready var points_label: Label = %PointsLabel
# Access timer
@onready var timer: Timer = %Timer
# Access timer label
@onready var timer_label: Label = %TimerLabel

# Start player with zero points
var player_points : int = 0


func _process(delta: float) -> void:
	# Get amount of time left and format it
	var time_left = str(int(%Timer.time_left)).pad_zeros(2)
	# Update timer label
	%TimerLabel.text = "Time left: " + str(time_left)

# Increase player points
func add_points(points: int):
	# Update points
	player_points += points
	# Update points label
	%PointsLabel.text = "Points: " + str(player_points)
