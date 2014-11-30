class AlliesController < ApplicationController
  before_action :set_ally, only: [:show, :edit, :update, :destroy]

  # GET /allies
  # GET /allies.json
  def index
    @allies = Ally.all
  end

  # GET /allies/1
  # GET /allies/1.json
  def show
  end

  # GET /allies/new
  def new
    @ally = Ally.new
  end

  # GET /allies/1/edit
  def edit
  end

  # POST /allies
  # POST /allies.json
  def create
    @ally = Ally.new(ally_params)

    respond_to do |format|
      if @ally.save
        format.html { redirect_to edit_ally_path(@ally), notice: 'Ally was successfully created.' }
        format.json { render :show, status: :created, location: @ally }
      else
        format.html { render :new }
        format.json { render json: @ally.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allies/1
  # PATCH/PUT /allies/1.json
  def update
    respond_to do |format|
      if @ally.update(ally_params)
        format.html { redirect_to edit_ally_path(@ally), notice: 'Ally was successfully updated.' }
        format.json { render :show, status: :ok, location: @ally }
      else
        format.html { render :edit }
        format.json { render json: @ally.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allies/1
  # DELETE /allies/1.json
  def destroy
    @ally.destroy
    respond_to do |format|
      format.html { redirect_to allies_url, notice: 'Ally was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ally
      @ally = Ally.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ally_params
      params.require(:ally).permit(:name,nicknames_attributes: [:nick])
    end
end
