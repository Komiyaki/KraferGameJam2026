extends RigidBody2D

var mouse_hovering: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    mouse_entered.connect(mouse_hover)
    mouse_exited.connect(mouse_unhover)
    input_event.connect(handle_input_event)

func mouse_hover() -> void:
    print("Mouse hovering")
    mouse_hovering = true

func mouse_unhover() -> void:
    print("Mouse not hovering")
    mouse_hovering = false

func handle_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    print(event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
