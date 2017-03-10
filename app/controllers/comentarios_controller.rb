class ComentariosController < ApplicationController

  def create
    @noticia = Noticium.find(params[:noticium_id])
    @comentario = @noticia.comentarios.create(comentario_params)
    redirect_to @noticia
  end

  private
    def comentario_params
      params.require(:comentario).permit(:autor, :contenido)
    end
end
