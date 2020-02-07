class ProdutosController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]
    
    def index
        @produtos_por_nome = Produto.all.order(:nome).limit 10
        @produtos_por_preco = Produto.all.order(:preco).limit 2
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def edit
        @departamentos = Departamento.all
        render :edit
    end

    def update
        if @produto.update(params_produto)
            flash[:notice] = "Produto Atualizado com sucesso"
            redirect_to root_url
        else
            @departamentos = Departamento.all
            render :edit
        end
    end

    def busca
        @nome_a_buscar = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    def create
        @produto = Produto.new(params_produto)
        if @produto.save
            flash[:notice] = "Produto criado com sucesso"
            redirect_to root_url
        else
            @departamentos = Departamento.all
            render :new
        end
    end

    def destroy
        @produto.destroy
        flash[:notice] = "Produto removido com sucesso"
        redirect_to root_url
    end

    private

    def set_produto
        id = params[:id]
        @produto = Produto.find(id)
    end

    def params_produto
        params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
    end
end

