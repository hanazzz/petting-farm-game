extends Node

# Access points label
@onready var points_label: Label = %PointsLabel
# Access timer
@onready var timer: Timer = %Timer
# Access timer label
@onready var timer_label: Label = %TimerLabel
@onready var start_panel: Node = $"../UI/StartPanel"

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


func _on_start_button_pressed() -> void:
	# Hide start overlay screen
	start_panel.queue_free()
	# Start timer
	timer.start()
