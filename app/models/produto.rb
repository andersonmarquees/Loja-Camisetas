class Produto < ApplicationRecord
    validates :quantidade, :preco, :nome, :descricao, presence: true
    validates :nome, length: { minimum: 5}
end
