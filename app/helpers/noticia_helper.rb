module NoticiaHelper

  def truncar (palabra)
    if palabra.length >= 1000
      palabra[0, 999] + "..."
    else
      palabra
    end
  end

end
