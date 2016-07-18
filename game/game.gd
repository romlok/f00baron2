
extends Node2D

func _init():
	randomize()

func _ready():
	# Set the player colours
	get_node("airspace/player1").set_colour('ff0000')
	get_node("airspace/player2").set_colour('aa88ff')
	set_process(true)
	

func _process(delta):
	# Tell the planes what to do
	var player1 = get_node("airspace/player1")
	if Input.is_action_pressed("p1_throttle_up"):
		player1.set_throttle(1)
	elif Input.is_action_pressed("p1_throttle_down"):
		player1.set_throttle(0)
	if Input.is_action_pressed("p1_clockwise"):
		player1.set_pitching(1)
	elif Input.is_action_pressed("p1_anticlockwise"):
		player1.set_pitching(-1)
	else:
		player1.set_pitching(0)
	player1.set_firing(Input.is_action_pressed("p1_fire"))
	# Player 2
	## TODO
	

func _on_airspace_body_exit( body ):
	# Something physics-al has left the arena
	var arena = get_node("airspace/playground")
	var half_width = arena.get_shape().get_extents().x
	var left = arena.get_pos().x - half_width
	var right = arena.get_pos().x + half_width
	var pos = body.get_pos()
	if pos.x < left:
		pos.x = right
		body.set_pos(pos)
	elif pos.x > right:
		pos.x = left
		body.set_pos(pos)
	
