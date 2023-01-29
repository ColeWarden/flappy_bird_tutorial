extends Sprite

""" This is our bird character. It falls down and can jump by pressing space"""

# Higher values = higher velocity achievable
const MAX_DOWN_VELOCITY: float = 350.0
const MAX_UP_VELOCITY: float = 350.0

var jump_height: float = 720.0
var gravity: float = 0.0#1.3
var y_velocity: float = 0.0
var points: int = 0

func _process(delta: float) -> void:
	# Every frame or "tick" in the _process function applies gravity. 
	y_velocity += gravity

	# If space is pressed, jump
	if Input.is_action_just_pressed("space"):
		y_velocity -= jump_height

	# Clamp our y velocity, limits jumping up/falling down speed
	y_velocity = clamp(y_velocity, -MAX_DOWN_VELOCITY, MAX_UP_VELOCITY)

	# Add y velocity to current y position, we times by delta here to make it
	# consistent to the frames per second
	position.y += (y_velocity * delta)


func _on_Area2D_area_exited(area: Area2D) -> void:
	points += 1
	print("Points = ", points)
