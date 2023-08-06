class_name Click_Presenter
extends TextureButton


var _click : Click 
var _label : Label
var _time_slapped : int = 0


func _ready():
	_click = $"../../Model/Click"
	_label = $"../../View/Click_label"


func _process(_delta):
	_time_slapped += 1
	
	match _click._type:
		_click.click_type.MANUAL_CLICK:
			pass
			
		_click.click_type.AUTO_CLICK:
			if _time_slapped % 60 / _click.get_click_multiplier() == 0:
				_add_click(1)


func _update_view() -> void:
	_label.text = "CLICKS:" + str(_click.get_total_clicks())


func _add_click(amount:int) -> void:
	_click.increment(amount)
	_update_view()


func _remove_click(amount:int) -> void:
	_click.decrement(amount)
	_update_view()


func _on_button_up():
	_add_click(1)


func _on_check_button_toggled(button_pressed):
	if button_pressed:
		_click.set_type(_click.click_type.AUTO_CLICK) 
	else: 
		_click.set_type(_click.click_type.MANUAL_CLICK)


func _on_item_list_item_selected(index):
	match index:
		0:
			_click.set_click_multiplier(2)
			print(_click.get_click_multiplier())
		1:
			_click.set_click_multiplier(4)
			print(_click.get_click_multiplier())
		2:
			_click.set_click_multiplier(8)
			print(_click.get_click_multiplier())
