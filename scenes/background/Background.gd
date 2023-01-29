extends Sprite

var scrolling_speed: float = 60.0

func _process(delta: float) -> void:
	position.x -= (scrolling_speed * delta)
	if (position.x < -144):
		position.x = 0
