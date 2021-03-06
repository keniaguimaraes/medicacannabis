class EfeitocolateralsController < ApplicationController
  before_action :set_efeitocolateral, only: %i[ show edit update destroy ]

  # GET /efeitocolaterals or /efeitocolaterals.json
  def index
    add_breadcrumb "Pagina Principal", root_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Efeitos Colaterais"
  
    @efeitocolaterals = Efeitocolateral.all
  end

  # GET /efeitocolaterals/1 or /efeitocolaterals/1.json
  def show
  end

  # GET /efeitocolaterals/new
  def new
    @efeitocolateral = Efeitocolateral.new
  end

  # GET /efeitocolaterals/1/edit
  def edit
  end

  # POST /efeitocolaterals or /efeitocolaterals.json
  def create

    @efeitocolateral = Efeitocolateral.new(efeitocolateral_params)
    #@efeitocolateral.user_id = current_user.id
    respond_to do |format|
      if @efeitocolateral.save
        format.html { redirect_to efeitocolaterals_url }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @efeitocolateral.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /efeitocolaterals/1 or /efeitocolaterals/1.json
  def update
    respond_to do |format|
      if @efeitocolateral.update(efeitocolateral_params)
        format.html { redirect_to efeitocolaterals_url }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @efeitocolateral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efeitocolaterals/1 or /efeitocolaterals/1.json
  def destroy
    @efeitocolateral.destroy
    respond_to do |format|
      format.html { redirect_to efeitocolaterals_url, notice: "Efeitocolateral was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_efeitocolateral
      @efeitocolateral = Efeitocolateral.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def efeitocolateral_params
      params.require(:efeitocolateral).permit(:descricao)
    end
end
