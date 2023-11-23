extends HBoxContainer


var RECT_LIVE_SCENE = preload("res://ui/live_rect.tscn")

func _ready():
	Events.lives_changed.connect(update_lives)
	update_lives(Globals.lives)

func update_lives(lifes: int):
	if lifes < 0:
		return
	var diff = lifes - get_child_count()
	for i in range(abs(diff)):
		add_live() if diff > 0 else remove_live()

func add_live():
	add_child(RECT_LIVE_SCENE.instantiate())
	
func remove_live():
	get_child(0).queue_free()
