class HomeController< ApplicationController
  def index

  	@productos = Producto.all
  end

  def buscar

  	@marcas =  [ "Samsung", "Sony", "LG", "Aoc"]
  	@importancias = [['Obligatorio', 1 ] ,['Importante', 2],['Mas o menos importante', 3],['Sin ésto',4]]
  	@tipos =  [ "Led", "Lcd"]

  	
  	if params[:busqueda]
  	 encondedsql= ""





		 if not params[:busqueda][:marca].eql?("")

	  	 case params[:busqueda][:marca_importancia].to_i
			when 1
			  encondedsql = encondedsql + "+"
			when 2
			  encondedsql = encondedsql + ">"
			when 3
			  encondedsql = encondedsql + "~"
			when 4
			 encondedsql = encondedsql + "-"
			end

		 encondedsql = encondedsql + "marca"+params[:busqueda][:marca].downcase


		end




		 if not params[:busqueda][:tipo].eql?("")

		 	case params[:busqueda][:tipo_importancia].to_i
			when 1
			  encondedsql = encondedsql + " +"
			when 2
			  encondedsql = encondedsql + " >"
			when 3
			  encondedsql = encondedsql + " ~"
			when 4
			 encondedsql = encondedsql + " -"
			end

		 encondedsql = encondedsql + "tipo"+params[:busqueda][:tipo].downcase

		end







		if not params[:busqueda][:tamanio].eql?("")

		 case params[:busqueda][:tamanio_importancia].to_i
			when 1
			  encondedsql = encondedsql + " +"
			when 2
			  encondedsql = encondedsql + " >"
			when 3
			  encondedsql = encondedsql + " ~"
			when 4
			 encondedsql = encondedsql + " -"
			end

		 encondedsql = encondedsql + "pulgadas"+params[:busqueda][:tamanio]

		end





		if not (params[:busqueda][:min_price].eql?("") or params[:busqueda][:max_price].eql?(""))



		 min_price = params[:busqueda][:min_price].to_i
		 max_price = params[:busqueda][:max_price].to_i

		 precios = Array.new

		 if min_price>2000
		 	precios.push("mayoradosmil")
		 end
		 if min_price>1500
		 	precios.push("mayoramilquinientos")
		 end
		  if min_price>1000
		 	precios.push("mayoramil")
		 end

		if max_price <2000
		 	precios.push("menoradosmil")
		end
		if max_price <1500
		 	precios.push("menoramilquinientos")
		end

		if max_price <1000
		 	precios.push("menoramil")
		end



		 case params[:busqueda][:precio_importancia].to_i
			when 1
			  precios.each do |precio|
		 		encondedsql = encondedsql + " +" +precio
		 	end
			when 2
			    precios.each do |precio|
		 		encondedsql = encondedsql + " >" +precio
		 	end
			when 3
			    precios.each do |precio|
		 		encondedsql = encondedsql + " ~" +precio
		 	end
			when 4
			  precios.each do |precio|
		 		encondedsql = encondedsql + " -" +precio
		 	end

			end

		end
			


	@productos = Producto.find_by_sql("SELECT * , MATCH (encodedsqlrow) AGAINST ('"+encondedsql+"' IN BOOLEAN MODE ) AS score FROM productos ORDER BY score DESC LIMIT 0 , 30")


	render "home/resultados"


	end



	

	end




end