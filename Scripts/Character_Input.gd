var owner

#Quick movement input, I am sure that there is a better way, but it works.

func handle_input(event):
	if(event.type == InputEvent.KEY):
		if(event.is_pressed()):
			if(event.is_action_pressed("ui_up")):
				owner.change_direction(Vector2(0,-1))
				return
			if(event.is_action_pressed("ui_right")):
				owner.change_direction(Vector2(1,0))
				return
			if(event.is_action_pressed("ui_down")):
				owner.change_direction(Vector2(0,1))
				return
			if(event.is_action_pressed("ui_left")):
				owner.change_direction(Vector2(-1,0))
				return
		else:
			if(event.is_action_released("ui_up")): 
				owner.change_direction(Vector2(0,1))
				return
			if(event.is_action_released("ui_down")):
				owner.change_direction(Vector2(0,-1))
				return
			if(event.is_action_released("ui_left")):
				owner.change_direction(Vector2(1,0))
				return
			if(event.is_action_released("ui_right")):
				owner.change_direction(Vector2(-1,0))