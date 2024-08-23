extends Node3D
class_name Boat

@onready var number: Label3D = $Number

func increment_number() -> void:
	number.text = str(int(number.text) + 1)
