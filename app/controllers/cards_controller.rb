class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_deck, only: [:index, :new, :show, :create, :destroy]
  # before_action :api, only: [:new]
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
    @mycards = Card.where(deck_id: @deck)

  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = @deck.cards.new(card_params)
    orig = @card.original
    translation = CardService.api(orig)
    @card.update(target: translation)

    respond_to do |format|

      if @card.save
        # format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.html { redirect_to deck_cards_path(@deck), notice: 'Card was succesfully created.'}
        format.json { render :show, status: :created, location: @card }
      else
        format.html { redirect_to deck_cards_path(@deck), notice: 'Card already exists.' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = @deck.cards.find(params[:id])
    @card.destroy
    respond_to do |format|
      format.html { redirect_to deck_cards_path(@deck), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:original, :target, :language_id, :deck_id, :level, :correct, :wrong, :review)
    end

    def set_deck
      @deck = Deck.find(params[:deck_id])
    end

end
