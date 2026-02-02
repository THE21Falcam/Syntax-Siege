extends VBoxContainer
var instantiated_objects: Array = []
@onready var test = preload("res://COMMANDS/Move/move.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_button_button_up() -> void:
	var instance = test.instantiate()
	instantiated_objects.append(instance)
	#print(instantiated_objects)
	#instance.number = instantiated_objects.size()
	self.add_child(instance, true, 1)
