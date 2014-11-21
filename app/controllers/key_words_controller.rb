class KeyWordsController < ApplicationController
  before_action :set_key_word, only: [:show, :edit, :update, :destroy]

  # GET /key_words
  # GET /key_words.json
  def index
    @key_words = KeyWord.all
  end

  # GET /key_words/1
  # GET /key_words/1.json
  def show
  end

  # GET /key_words/new
  def new
    @key_word = KeyWord.new
  end

  # GET /key_words/1/edit
  def edit
  end

  # POST /key_words
  # POST /key_words.json
  def create
    @key_word = KeyWord.new(key_word_params)

    respond_to do |format|
      if @key_word.save
        format.html { redirect_to @key_word, notice: 'Key word was successfully created.' }
        format.json { render :show, status: :created, location: @key_word }
      else
        format.html { render :new }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_words/1
  # PATCH/PUT /key_words/1.json
  def update
    respond_to do |format|
      if @key_word.update(key_word_params)
        format.html { redirect_to @key_word, notice: 'Key word was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_word }
      else
        format.html { render :edit }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_words/1
  # DELETE /key_words/1.json
  def destroy
    @key_word.destroy
    respond_to do |format|
      format.html { redirect_to key_words_url, notice: 'Key word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_word
      @key_word = KeyWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_word_params
      params.require(:key_word).permit(:word, :type)
    end
end
