extends VBoxContainer

@export var god_name : String
@export_multiline var god_tooltip : String

func _ready() -> void:
	$Name.text = god_name
	$Name.tooltip_text = god_tooltip
