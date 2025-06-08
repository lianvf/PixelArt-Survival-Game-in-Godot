extends CharacterBody2D

var speed = 100
var player_state 

func _physics_process(delta):
	var direction = Input.get_vector( "left", "right", "up", "down")
	
	if direction.x == 0 and direction.y==0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = speed * direction
	move_and_slide()
	play_anim(direction)
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		var rounded_dir = dir.normalized().round()
		match rounded_dir:
			Vector2(0, -1):
				$AnimatedSprite2D.play("n-walk")
			Vector2(1, -1):
				$AnimatedSprite2D.play("ne-walk")
			Vector2(1, 0):
				$AnimatedSprite2D.play("e-walk")
			Vector2(1, 1):
				$AnimatedSprite2D.play("se-walk")
			Vector2(0, 1):
				$AnimatedSprite2D.play("s-walk")
			Vector2(-1, 1):
				$AnimatedSprite2D.play("sw-walk")
			Vector2(-1, 0):
				$AnimatedSprite2D.play("w-walk")
			Vector2(-1, -1):
				$AnimatedSprite2D.play("nw-walk")
			_:
				$AnimatedSprite2D.play("idle")
				
func player():
	pass
