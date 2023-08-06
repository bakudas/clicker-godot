class_name Click
extends Node2D

enum click_type {MANUAL_CLICK, AUTO_CLICK}

var _click_multiplier : int = 1
var _total_clicks : int = 0
var _type : click_type = click_type.MANUAL_CLICK
	

func set_type(newtype : click_type) -> void:
	_type = newtype


func get_type() -> click_type:
	return _type


func get_total_clicks() -> int:
	return _total_clicks
	

func increment(amount:int) -> void:
	_total_clicks = _total_clicks + amount


func decrement(amount:int) -> void:
	_total_clicks = _total_clicks - amount


func set_click_multiplier(amount) -> void:
	_click_multiplier = amount


func get_click_multiplier() -> int:
	return _click_multiplier
