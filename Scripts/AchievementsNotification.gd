extends Panel
@onready var achievementsAnim : AnimationPlayer = $AchievementsAnim
@onready var animatedCharacter : AnimatedSprite2D = $AnimatedCharacter
@onready var label : Label = $Label


func CheckThrophies():
	var sum : int = 0 
	for i in range(5):
		sum += GlobalScript.saveFile.levelTrophies[i]
	if sum == 15 and GlobalScript.saveFile.unlockedCharacters[0] == false:
		UnlockNinjaFrog()
		return
	sum = 0
	for i in range(5,10):
		sum += GlobalScript.saveFile.levelTrophies[i]
	if sum == 15 and GlobalScript.saveFile.unlockedCharacters[1] == false:
		UnlockFinWannabe()
		return
	sum = 0
	for i in range(10,15):
		sum += GlobalScript.saveFile.levelTrophies[i]
	if sum == 15 and GlobalScript.saveFile.unlockedCharacters[2] == false:
		UnlockAmogus()
		return



func UnlockNinjaFrog():
	GlobalScript.saveFile.unlockedCharacters[0] = true
	animatedCharacter.play("NinjaFrog")
	label.text = "UNLOCKED: Ninja Frog\n[get all throphies in level 1-5]"
	achievementsAnim.play("AchievementTriggered")
	GlobalScript.saveFile.WriteSaveGame()

func UnlockFinWannabe():
	GlobalScript.saveFile.unlockedCharacters[1] = true
	animatedCharacter.play("FinWannabe")
	label.text = "UNLOCKED: Fin Wannabe\n[get all throphies in level 6-10]"
	achievementsAnim.play("AchievementTriggered")
	GlobalScript.saveFile.WriteSaveGame()

func UnlockAmogus():
	GlobalScript.saveFile.unlockedCharacters[2] = true
	animatedCharacter.play("Amogus")
	label.text = "UNLOCKED: Amogus\n[get all throphies in level 11-15]"
	achievementsAnim.play("AchievementTriggered")
	GlobalScript.saveFile.WriteSaveGame()
