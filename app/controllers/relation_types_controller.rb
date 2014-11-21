class RelationTypesController < ApplicationController
  before_action :set_relation_type, only: [:show, :edit, :update, :destroy]

  # GET /relation_types
  # GET /relation_types.json
  def index
    @relation_types = RelationType.all
  end

  # GET /relation_types/1
  # GET /relation_types/1.json
  def show
  end

  # GET /relation_types/new
  def new
    @relation_type = RelationType.new
  end

  # GET /relation_types/1/edit
  def edit
  end

  # POST /relation_types
  # POST /relation_types.json
  def create
    @relation_type = RelationType.new(relation_type_params)

    respond_to do |format|
      if @relation_type.save
        format.html { redirect_to @relation_type, notice: 'Relation type was successfully created.' }
        format.json { render :show, status: :created, location: @relation_type }
      else
        format.html { render :new }
        format.json { render json: @relation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relation_types/1
  # PATCH/PUT /relation_types/1.json
  def update
    respond_to do |format|
      if @relation_type.update(relation_type_params)
        format.html { redirect_to @relation_type, notice: 'Relation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation_type }
      else
        format.html { render :edit }
        format.json { render json: @relation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relation_types/1
  # DELETE /relation_types/1.json
  def destroy
    @relation_type.destroy
    respond_to do |format|
      format.html { redirect_to relation_types_url, notice: 'Relation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation_type
      @relation_type = RelationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_type_params
      params.require(:relation_type).permit(:name,key_words_attributes:[:word])
    end
end
