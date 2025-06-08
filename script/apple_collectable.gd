extends StaticBody2D

func _ready():
	fallfromtree()

func fallfromtree():
	$AnimationPlayer.play("fallingFromTree")
	await  get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	await  get_tree().create_timer(0.3).timeout
	
