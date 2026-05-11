extends CharacterBody2D

var health = 3

#track main player when game run the instance is created
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position) #the current position of the character in the game
	velocity = direction * 300.0
	move_and_slide()
  
func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
	
		const SMOKE_SCENE = preload("uid://dhmhmrth6rdce")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
