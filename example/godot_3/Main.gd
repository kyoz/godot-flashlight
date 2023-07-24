extends Node


func _ready():
	Flashlight.init()
	
	var _o = Flashlight.connect("on_error", self, "_on_error")


func _on_error(error_message):
	print("Flashlight failed with error: " + error_message)



func _on_OnBtn_pressed():
	Flashlight.on()


func _on_OffBtn_pressed():
	Flashlight.off()
