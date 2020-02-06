class Produto < ApplicationRecord
    belongs_to :departamento
    validates :quantidade, :preco, :nome, :descricao, presence: true
    validates :nome, length: { minimum: 5}
end
