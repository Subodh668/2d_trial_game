extends CharacterBody2D

#track main player when game run the instance is created
@onready var player = get_node("/root/Game/Player")

#func _ready():
#	player = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position) #the current position of the character in the game
	velocity = direction * 300.0
	move_and_slide()
  
