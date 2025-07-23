class_name BarraSalud extends TextureProgressBar

func actualizar_barra(maximo: float, actual: float):
	self.value = actual/maximo
