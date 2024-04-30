extends Resource
class_name SaveFileResource

const SAVE_GAME_PATH := "user://savegame.tres"

@export var maxLevel : int = 1
@export var levelUnlocked : int = 1
@export var levelTrophies : Array[int] = []

func WriteSaveGame():
	ResourceSaver.save(self, SAVE_GAME_PATH)

static func LoadSaveGame() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
	
