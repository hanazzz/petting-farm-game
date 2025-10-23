extends Area2D

# Name of interaction
@export var interact_name: String = "[E] to interact"
# Indicate object is interactable
@export var is_interactable: bool = true

# interact() function is triggered by InteractingComponent
# interact() is where interactable object stores its interaction logic
# To define logic for an interactable object, set this property to a different function
var interact: Callable = func():
	pass
