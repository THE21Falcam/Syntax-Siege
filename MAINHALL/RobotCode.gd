extends Node2D

var instantiated_objects: Array = []
@onready var CONSOLE = $CONSOLE

var max_speed = 100
var input = Vector2.ZERO


@export var Speed:float = 100
var tile_size = 32

@onready var line_timer

var inputs = {
	"Right_Key":Vector2.RIGHT,
	"UP_Key":Vector2.UP,
	"Left_Key":Vector2.LEFT,
	"Down_Key":Vector2.DOWN
}

var Current_line = 0

func _process(delta: float) -> void:
	instantiated_objects = CONSOLE.instantiated_objects

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

	line_timer = Timer.new()
	line_timer.wait_time = 0.5  # 1 second delay [RUN SPEED]
	line_timer.one_shot = false
	add_child(line_timer)
	line_timer.timeout.connect(_on_line_timer_timeout)

func start_code():
	Current_line = 0
	CONSOLE.Code_Run = true
	line_timer.start()

func _on_line_timer_timeout():
	
	if CONSOLE.Code_Run and Current_line < instantiated_objects.size():
		if instantiated_objects[Current_line].Command == "Move":
			instantiated_objects[Current_line].MoveCommandRun($ROBOT)
		elif instantiated_objects[Current_line].Command == "J2L":
			Current_line = int(instantiated_objects[Current_line].J2LCommandRun(Current_line) - 1)
		
		Current_line += 1
	else:
		CONSOLE.Code_Run = false
		line_timer.stop()
		CONSOLE.RUN.disabled = false
		CONSOLE.STOP.disabled = true
