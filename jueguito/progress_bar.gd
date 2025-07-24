class_name BarraSalud extends ProgressBar #Acá cambie el Barra de Salud para que ande

func actualizar_barra(maximo: float, actual: float):
	self.value = actual/maximo
