extends KinematicBody2D

export var speed = 50
export var health = 100

#For now I will place the input here to have quick results but a input manager would be better
onready var input = preload("Character_Input.gd").new()
onready var animator = find_node("Animator")
onready var sprite = find_node("Sprite")

var direction = Vector2(0.0,0.0)

func _ready():
	input.owner = self
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	input.handle_input(event)

func change_direction(mod_direction):
	direction += mod_direction
	if(direction.length() == 0):
		animator.stop(false)
		return
	else:
		var identify = -3*direction.dot(Vector2(0,1)) + 2*direction.dot(Vector2(1,0))
		if(identify == 3): animator.play("Walk_up"); return
		if(identify == -3): animator.play("Walk_Down"); return
		if(identify == 2): sprite.set_flip_h(true); animator.play("Walk_left"); return
		if(identify == -2): sprite.set_flip_h(false); animator.play("Walk_left");

func _fixed_process(delta):
	move(direction.normalized()*speed*delta)