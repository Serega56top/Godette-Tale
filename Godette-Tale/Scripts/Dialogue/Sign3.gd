extends StaticBody2D
#class_name InteractableItem

onready var tie = get_node("/root/Root_Node/CanvasLayer/panel/text_interface_engine")
onready var dialogue = tie.get_parent()

# By default interactable items are only availble to the Player class
func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

func interaction_interact(interactionComponentParent : Node) -> void:
	if !dialogue.is_visible():
		tie.reset()
		tie.portrait_visible(true)
		tie.NPCid("Sans")
		tie.set_color(Color(1,1,1))
		tie.set_font_bypath("res://addons/GodotTIE/Fonts/Comic-Sans-UT.tres")
		tie.buff_typesound("res://addons/GodotTIE/Sans.wav")
		tie.buff_face("res://Assets/Expressions/Sans/Sans.png")
		tie.buff_panel("show")
		# Buff text: "Text", duration (in seconds) of each letter
		tie.buff_text("* Turn around and shake\n", 0.15)
		tie.buff_text("  my hand.", 0.15)
		tie.buff_break()
		tie.buff_clear()
		tie.buff_panel("hide")
		tie.buff_face("res://Assets/Expressions/None.png")
		tie.set_state(tie.STATE_OUTPUT)
