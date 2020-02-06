class DepartamentosController < ApplicationController

    def index
        @departamentos = Departamento.all
    end

    def new
        @departamento = Departamento.new
    end

    def create
        dpto = params.require(:departamento).permit :nome
        @departamento = Departamento.new dpto
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
        id = params[:id]
        Departamento.destroy id
        redirect_to departamentos_path
    end

end
