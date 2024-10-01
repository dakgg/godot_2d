extends ParallaxBackground

@export var bgImage:CompressedTexture2D
@export var scrollSpeedX = 10
@export var scrollSpeedY = 10
@onready var sprite = $ParallaxLayer/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = bgImage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	sprite.region_rect.position += delta * Vector2(scrollSpeedX, scrollSpeedY)
	if sprite.region_rect.position.x >= 1024 || sprite.region_rect.position.y >= 1024:
		sprite.region_rect.position = Vector2.ZERO
