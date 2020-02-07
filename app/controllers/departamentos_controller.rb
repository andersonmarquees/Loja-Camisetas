class DepartamentosController < ApplicationController

    before_action :set_departamento, only: [:edit, :update, :destroy]

    def index
        @departamentos = Departamento.all
    end

    def new
        @departamento = Departamento.new
    end

    def edit
        render :edit
    end

    def update
        if @departamento.update(params_departamento)
            flash[:notie] = "Departamento Atualizado com sucesso"
            redirect_to departamentos_path
        else
            render :edit
        end
    end

    def create
        @departamento = Departamento.new params_departamento
        if @departamento.save
            flash[:notice] = "Departamento criado com sucesso"
            redirect_to @departamento
        else
            render :new
        end
    end
    def show
        @departamento = Departamento.find(params[:id])
    end

    def destroy
        @departamento.destroy
        redirect_to departamentos_path
    end

    private

    def params_departamento
        params.require(:departamento).permit :nome
    end

    def set_departamento
        id = params[:id]
        @departamento = Departamento.find(id)
    end

end
