extends VBoxContainer

@export var god_name : String
@export_multiline var god_tooltip : String

@onready var name_label: Label = $Name

func _ready() -> void:
	name_label.text = god_name
	name_label.tooltip_text = god_tooltip
