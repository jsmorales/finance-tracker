class StocksController < ApplicationController

	#para que esto funcione en el browser de digita
	#localhost:3000/search_stocks?stock=GOOG
	#que es el controlador que ejecuta la ccion search con el parametro stock y el valor del mismo
	def search
		#este metodo va a validar si esta el parametro stock
		if params[:stock]
			#va a buscar el stock por el metodo del modelo
			@stock = Stock.find_by_ticker(params[:stock])
			#si existe en la base de datos entonces busca con el mismo
			#parametro para retornar el objeto con los datos requeridos
			@stock ||= Stock.new_from_lookup(params[:stock])
		end

		if @stock
			#se renderiza una vista parcial llamada lookup
			render partial: 'lookup'
			#muestra en json esto equilave a un printr en php
			#render json: @stock
		else
			#
			render status: :not_found, nothing: true
		end

	end

end
