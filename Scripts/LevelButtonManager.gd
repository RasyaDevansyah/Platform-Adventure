extends HFlowContainer


func _ready():
	var children = get_children()
	for i in range(1,get_child_count()):
		children[i].disabled = true
	
	for levelButton in children:
		for trophy in levelButton.get_children():
			trophy.visible = false
	
