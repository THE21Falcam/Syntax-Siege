extends Control

@onready var MOVE = preload("res://COMMANDS/Move/move.tscn")
@onready var J2L = preload("res://COMMANDS/JumpToLine/Jump2Line.tscn")

var Code_Run = false
var instantiated_objects: Array = []

@onready var ADDCOMMAND = $SHOW/VBoxContainer

@onready var RUN = $EXECUTE/RUN
@onready var STOP = $EXECUTE/STOP

func _on_run_button_up() -> void:
	get_tree().current_scene.start_code()
	RUN.disabled = true
	STOP.disabled = false

func _on_stop_button_up() -> void:
	Code_Run = false
	RUN.disabled = false
	STOP.disabled = true

func _on_plus_button_up() -> void:
	$SHOW.hide()
	$SELECT.show()


func _on_moveadd_button_up() -> void:
	var instance = MOVE.instantiate()
	instantiated_objects.append(instance)
	ADDCOMMAND.add_child(instance, true, 1)
	$SHOW.show()
	$SELECT.hide()


func _on_j_2ladd_button_up() -> void:
	var instance = J2L.instantiate()
	instantiated_objects.append(instance)
	ADDCOMMAND.add_child(instance, true, 1)
	$SHOW.show()
	$SELECT.hide()
