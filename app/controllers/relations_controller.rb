class RelationsController < ApplicationController
  before_action :set_relation, only: [:show, :edit, :update, :destroy]

  # GET /relations
  # GET /relations.json
  def index
    @relations = Relation.all
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
  end

  # GET /relations/new
  def new
    @relation = Relation.new
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.new(relation_params)

    respond_to do |format|
      if @relation.save
        format.html { redirect_to @relation, notice: 'Relation was successfully created.' }
        format.json { render :show, status: :created, location: @relation }
      else
        format.html { render :new }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relations/1
  # PATCH/PUT /relations/1.json
  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to @relation, notice: 'Relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to relations_url, notice: 'Relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def suggest
    journal_number   = params[:journal_number].to_i
    candidate_id     = params[:candidate_id].to_i
    relation_type_id = params[:relation_type_id].to_i
    ally_id          = params[:ally_id].to_i

    journal_url = JOURNALS[journal_number][1]

    candidate      = Candidate.find(candidate_id)
    cand_nicknames = candidate.nicknames.to_a

    relation_type  = RelationType.find(relation_type_id)
    key_words      = relation_type.key_words.to_a

    ally           = Ally.find(ally_id)
    ally_nicknames = ally.nicknames.to_a


    render :text => BettySugestions.new.suggestions_for(journal_url,cand_nicknames,key_words,ally_nicknames) 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.require(:relation).permit(:link_id, :ally_id, :candidate_id, :relation_type_id,link_attributes: [:title,:content,:journal,:author,:url])
    end
end
