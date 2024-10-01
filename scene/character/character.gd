extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta: float):
	animated_sprite.play("run")
