extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta): 
	#get user vectors of user input or the key pressed
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	#override the velocity of the character when key pressed
	velocity = direction * 600
	#function to move and slide to obstacle based on the velocity and the keys pressed
	move_and_slide()
	
	#when key pressed the direction vector increases so the velocity and trigger animations
	if velocity.length() > 0.0: 
		%HappyBoo.play_walk_animation() # % indicates the custom node 
	else: 
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
			
