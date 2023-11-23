extends CharacterBody2D

const ROCKET_SCENE = preload("res://elements/raketa/rocket.tscn")

const SPEED = 300.0

func _physics_process(delta: float):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()


func shot():
	
	#Инициализация ракеты
	var rocket = ROCKET_SCENE.instantiate()
	
	#Выставляем смещение относительно корабля
	rocket.global_position = global_position + Vector2(0, -26)
	add_child(rocket)

func take_damage():
	Globals.lives_changed(-1)
