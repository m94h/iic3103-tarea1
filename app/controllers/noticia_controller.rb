class NoticiaController < ApplicationController

def index
  @noticias = Noticium.all
end


def show
  @noticia = Noticium.find(params[:id])
end

def new
end

def create
  # Para inspeccionar que hay en los parametros recibidos por post
  #render plain: params[:noticia].inspect
  #@noticia = Noticium.new(params[:noticia])
  @noticia = Noticium.new(noticia_params)
  @noticia.save
  redirect_to @noticia
end

private
  def noticia_params
    params.require(:noticia).permit(:titulo, :bajada, :cuerpo)
  end

end
