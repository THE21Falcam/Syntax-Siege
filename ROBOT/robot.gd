extends CharacterBody2D

@onready var RAYCAST = $RayCast2D
var DIRECTION = Vector2.RIGHT
var MOVE_SPEED = 5
var TILE_SIZE = 32
var MOVING = false

func _process(delta: float) -> void:
	$ANCOR.rotation = DIRECTION.angle()

func MOVE():
	if !RAYCAST.is_colliding():
		var HeadTween = get_tree().create_tween()
		HeadTween.tween_property(self, "position", self.position + DIRECTION * TILE_SIZE, 1.0/MOVE_SPEED).set_trans(Tween.TRANS_SINE)
		MOVING = true
		await HeadTween.finished
		MOVING = false
