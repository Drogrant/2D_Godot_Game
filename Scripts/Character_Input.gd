var owner

var r_or_l = true
var u_or_d = true

#Quick movement input, I am sure that there is a better way, but it works.

func handle_input(event):
	if(event.type == InputEvent.KEY):
		if(event.is_pressed()):
			if(event.is_action_pressed("ui_up")):
				owner.direction_Y = -1.0
				u_or_d = true
				return
			if(event.is_action_pressed("ui_right")):
				owner.direction_X = 1.0
				r_or_l = true
				return
			if(event.is_action_pressed("ui_down")):
				owner.direction_Y = 1.0
				u_or_d = false
				return
			if(event.is_action_pressed("ui_left")):
				owner.direction_X = -1.0
				r_or_l = false
				return
		else:
			if(event.is_action_released("ui_up") and u_or_d): 
				owner.direction_Y = 0.0
				return
			if(event.is_action_released("ui_down") and !u_or_d):
				owner.direction_Y = 0.0
				return
			if(event.is_action_released("ui_left") and !r_or_l):
				owner.direction_X = 0.0
				return
			if(event.is_action_released("ui_right") and r_or_l):
				owner.direction_X = 0.0