extends StaticBody2D

@export var break_delay: float = 0.7  # Thời gian (s) trước khi platform biến mất

var time_counter: float = 0.0

func _ready() -> void:
	# Ban đầu tắt process, chỉ bật khi có va chạm
	set_process(false)
	$Timer.one_shot = true
	


func _process(delta: float) -> void:
	# Nếu đã bật process, thì platform sẽ rung lắc lên xuống
	time_counter += delta
	# Giả sử bạn dùng Sprite2D để hiển thị tile, đổi tên node nếu khác
	$Sprite2D.position.y = sin(time_counter * 10.0) * 2.0  # tốc độ*10, biên độ 2px


func _on_area_body_entered(body: Node) -> void:
	# Bất cứ body nào chạm vào Area2D cũng sẽ kích hoạt
	# (nếu bạn muốn loại trừ ví dụ shield thì check body.is_in_group("shield")...)
	set_process(true)
	$Timer.start(break_delay)


func _on_timer_timeout() -> void:
	# Khi Timer timeout thì xóa platform
	queue_free()
