extends Control

@export var Command = "J2L"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_parent().instantiated_objects != null:
		$Label.text = str(get_parent().instantiated_objects.find(self))



func _on_button_2_button_up() -> void:
	get_parent().instantiated_objects.erase(self)
	queue_free()
