extends CharacterBody2D

@onready var animation := $AnimatedSprite2D

const SPEED = 100



func _physics_process(delta: float):
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	
	#Важна проверка на наличие коллизии, чтобы она не оказалась пустой
	#Проверка на столкновение
	if collision:
		var collider = collision.get_collider()
		
		#Проверяем, есть ли метод "destroy" 
		if collider.has_method("destroy"):
			collider.destroy()
		queue_free()

func _process(delta: float):
	animation.play("raketalet")

#Ловля сигнала
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
