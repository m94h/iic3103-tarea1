class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.string :autor
      t.text :contenido
      t.references :noticium, foreign_key: true

      t.timestamps
    end
  end
end
