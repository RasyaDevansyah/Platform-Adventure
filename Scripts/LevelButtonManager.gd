extends HFlowContainer


func _ready():
	
	GlobalScript.saveFile.maxLevel = get_child_count() + 1
	
	while GlobalScript.saveFile.levelTrophies.size() != get_child_count():
		if GlobalScript.saveFile.levelTrophies.size() < get_child_count():
			GlobalScript.saveFile.levelTrophies.push_back(-1)
		else:
			GlobalScript.saveFile.levelTrophies.pop_back()
			
		GlobalScript.saveFile.WriteSaveGame()

	var children = get_children()
	for i in range(GlobalScript.saveFile.levelUnlocked ,get_child_count()):
		children[i].disabled = true
	
	var currentLevel = 0
	for levelButton in children:
		var count = 0
		if GlobalScript.saveFile.levelTrophies[currentLevel] != -1:
			count = GlobalScript.saveFile.levelTrophies[currentLevel]
	
		for trophy in levelButton.get_children():
			if count <= 0:
				break
			trophy.visible = true
			count -= 1
			
		currentLevel += 1
	
