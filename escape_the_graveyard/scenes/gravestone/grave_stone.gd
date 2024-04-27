extends Area2D

#@onready var point_earned_sound = $PointEarnedSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPEED
	

func _on_screen_exited():
	queue_free()
	#print("pipe is not visible")

func _on_stone_body_entered(body):
	print("_on_pipe_body_entered ", body)
	if body.is_in_group(GameManager.GROUP_PLAYER):
		if body.has_method("die"):
			body.die()
		print("_on_pipe_body_entered ", body)
		
		
#func _on_laser_body_exited(body):
	#if body.is_in_group(GameManager.GROUP_PLAYER):
		#ScoreManager.increment_score()
		#point_earned_sound.play()
