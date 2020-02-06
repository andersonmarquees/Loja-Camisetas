class AddDepartamentoRefToProduto < ActiveRecord::Migration[6.0]
  def change
    add_reference :produtos, :departamento, foreign_key: true
  end
end
