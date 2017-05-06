#se crean los metodos a nivel de clase para no tener que
#instanciar la misma, esto se escribe como def self.nombremetodo

#esto debe funcionar en la consola rails

class Stock < ApplicationRecord
	#este metodo retorna una busqueda en la bd de un registro
	#con ticker segun la variable que se le pase
	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end
	
	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		#se retorna null si no existe un resultado
		return nil unless looked_up_stock.name

		#si existe el simbolo se retorna un objeto ActiveRecord con estos atributos
		new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
		new_stock.last_price = new_stock.price
		new_stock
	end
	#este metodo se trata de forma diferente
	def price
		closing_price = StockQuote::Stock.quote(ticker).close
		return "#{closing_price} (Closing)" if closing_price

		opening_price = StockQuote::Stock.quote(ticker).open
		return "#{opening_price} (Opening)" if opening_price

		"Unavailable"
	end

end
