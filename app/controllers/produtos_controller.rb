class ProdutosController < ApplicationController
    def index
        @produtos_por_nome = Produto.all.order(:nome).limit 5
        @produtos_por_preco = Produto.all.order(:preco).limit 2
    end

    def create
        valores = params.require(:produto).permit!
        produto = Produto.create valores
    end
end
