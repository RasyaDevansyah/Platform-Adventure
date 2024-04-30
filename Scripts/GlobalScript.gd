extends Node

var saveFile : SaveFileResource = preload("res://Resource/SaveFile.tres")

func _ready():
	# Attempt to load the save game
	var loadedSaveFile = SaveFileResource.LoadSaveGame()
	# Check if save file loaded successfully
	if loadedSaveFile == null:
		# If not, create a new save file
		print("Creating new save file...")
		saveFile.levelUnlocked = 1
		saveFile.levelTrophies = []
		saveFile.WriteSaveGame()
	else:
		# Save file loaded successfully
		print("Save file loaded successfully.")
		saveFile = loadedSaveFile
		

var totalFruit : int = 0


