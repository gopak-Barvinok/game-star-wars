extends Node2D

const ROW_STEP = 5.0
const SPEED_BOOST := 2.5

@onready var block_timer := $block_timer
@onready var shot_timer := $bullet_timer

var direction := Vector2.RIGHT
var speed := 5.0

func _process(delta):
	global_position += direction * speed * delta

func change_direction():
	if block_timer.time_left > 0:
		return

	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += ROW_STEP
	speed += SPEED_BOOST
	#Заново запускаем таймер
	block_timer.start()


func _on_bullet_timer_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() > 0:
		enemies.pick_random().shot()
