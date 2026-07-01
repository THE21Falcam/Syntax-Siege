# NUMBER OF STEPS
# DIRENTION OF MOVEMENT

extends Control

@export var Command = "Move"

func _process(delta: float) -> void:
	if get_tree().current_scene.instantiated_objects != null:
		$INDEX_NUM.text = str(get_tree().current_scene.instantiated_objects.find(self)) # Sets Number in Current Line

func MoveCommandRun(ROBOT):
	ROBOT.MOVE()

func _on_button_2_button_up() -> void: # Remove Self Instence
	get_tree().current_scene.instantiated_objects.erase(self)
	queue_free()
