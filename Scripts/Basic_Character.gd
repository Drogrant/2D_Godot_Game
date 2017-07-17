extends KinematicBody2D

export var speed = 50
export var health = 100

#For now I will place the input here to have quick results but a input manager would be better
onready var input = preload("Character_Input.gd").new()
var direction_X = 0.0
var direction_Y = 0.0

func _ready():
	input.owner = self
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	input.handle_input(event)

func _fixed_process(delta):
	move(Vector2(direction_X,direction_Y).normalized()*speed*delta)