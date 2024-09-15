extends Node
signal ireg
signal dreex
signal shijo

#Mapa
signal zoomAlBotonRegion
signal enviarValorRegion
signal salirDescripcion

#DragDrop
signal dragEliminado
signal newDrag

#Gestor de dialogos
signal mostrarIndicacion
signal mostrarFelicitacion

#Memorama
signal memorama_reiniciar

func reiniciar_memorama():
	emit_signal("memorama_reiniciar")
