class CreateAdministracaos < ActiveRecord::Migration[6.0]
  def change
    create_table :administracaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
