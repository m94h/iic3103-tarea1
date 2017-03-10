class NoticiaController < ApplicationController

def index
  @current_modulo = 'visualizador'
  # Order por fecha = id, limite 10
  @noticias = Noticium.order(created_at: :desc).limit(10)
end

def admin
  @current_modulo = 'administrador'
  # Order por fecha = id
  @noticias = Noticium.order(created_at: :desc)
end

def show
  @current_modulo = 'visualizador'
  @noticia = Noticium.find(params[:id])
end

def new
  @current_modulo = 'administrador'
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
    render 'edit'
  end

end

private
  def noticia_params
    params.require(:noticia).permit(:titulo, :bajada, :cuerpo)
  end

end
