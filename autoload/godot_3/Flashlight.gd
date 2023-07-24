extends Node

signal on_error(error_message)

var flashlight = null


# Change this to _ready() if you want automatically init
func init():
	if Engine.has_singleton("Flashlight"):
		flashlight = Engine.get_singleton("Flashlight")
		init_signals()


func init_signals():
	flashlight.connect("error", self, "_on_error")


func _on_error(error_message):
	emit_signal("on_error", error_message)


func on():
	if not flashlight:
		not_found_plugin()
		return
	
	flashlight.toggle(true)


func off():
	if not flashlight:
		not_found_plugin()
		return
	
	flashlight.toggle(false)


func not_found_plugin():
	print('[Flashlight] Not found plugin. Please ensure that you checked Flashlight plugin in the export template')
