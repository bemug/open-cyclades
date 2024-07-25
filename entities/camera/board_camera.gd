extends Camera3D

@export var speed: float = 10

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func move_camera(delta: float) -> void:
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var resolution: Vector2 = DisplayServer.window_get_size()
	var move: Vector2 = Vector2.ZERO
	if mouse_pos.x <= 0:
		move += Vector2.LEFT
	elif mouse_pos.x >= resolution.x - 1:
		move += Vector2.RIGHT
	if mouse_pos.y <= 0 :
		move += Vector2.UP
	elif mouse_pos.y >= resolution.y - 1:
		move += Vector2.DOWN
	position.x += move.x * speed * delta
	position.z += move.y * speed * delta

func handle_mouse_confinement(event: InputEvent) -> void:
	if event.is_action_pressed("deconfine_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseButton:
		#Re-confine on left mouse click
		var mouse_button: InputEventMouseButton = event
		if mouse_button.button_index == MOUSE_BUTTON_LEFT and mouse_button.is_pressed():
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _process(delta: float) -> void:
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CONFINED:
		move_camera(delta)

func _input(event: InputEvent) -> void:
	handle_mouse_confinement(event)