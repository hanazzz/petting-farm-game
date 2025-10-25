extends Node

# Access points label
@onready var points_label: Label = %PointsLabel
# Access timer
@onready var timer: Timer = %Timer
# Access timer label
@onready var timer_label: Label = %TimerLabel
# Access game over screen
@onready var game_over: CanvasLayer = $"../GameOver"
@onready var game_summary: Label = $"../GameOver/GameSummary"


# Start player with zero points
var player_points : int = 0


func _process(_delta: float) -> void:
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


# End game when timer ends
func _on_timer_timeout() -> void:
	game_over.show()
	get_tree().paused = true
	game_summary.text = str("You scored ", player_points, " points!")


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")
