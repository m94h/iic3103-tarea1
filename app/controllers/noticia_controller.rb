class NoticiaController < ApplicationController

def index
  @current_modulo = 'visualizador'
  # Order por fecha = id, limite 10
  @noticias = Noticium.GetAllOrdered(10)
end

def admin
  @current_modulo = 'administrador'
  # Order por fecha = id
  @noticias = Noticium.GetAllOrdered
end

def show
  @current_modulo = 'visualizador'
  @noticia = Noticium.find(params[:id])
end

def new
  @current_modulo = 'administrador'
  @noticia = Noticium.new
end

def edit
  @current_modulo = 'administrador'
  @noticia = Noticium.find(params[:id])
end

def update
  @noticia = Noticium.find(params[:id])

  if @noticia.update(noticia_params)
    redirect_to @noticia
  else
    render 'edit'
  end
end


def destroy
  @noticia = Noticium.find(params[:id])
  @noticia.destroy

  redirect_to noticia_admin_path
end

def create
  # Para inspeccionar que hay en los parametros recibidos por post
  #render plain: params[:noticia].inspect
  #@noticia = Noticium.new(params[:noticia])
  @noticia = Noticium.new(noticia_params)
  if @noticia.save
    redirect_to @noticia
  else
    render 'new'
  end

end

private
  def noticia_params
    params.require(:noticium).permit(:titulo, :bajada, :cuerpo)
  end

end
