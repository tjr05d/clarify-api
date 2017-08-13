class ClarificationsController < ApplicationController
  before_action :set_clarification, only: [:show, :update, :destroy]

  # GET /clarifications
  def index
    @clarifications = Clarification.all

    render json: @clarifications
  end

  # GET /clarifications/1
  def show
    render json: @clarification
  end

  # POST /clarifications
  def create
    #find records that come from the same url
    #search them for commonn words.
    #if the request has 70% tokens in common with the selected text, return a canned response, 
    #if not offer other suggested responses from similar token sets
    url = clarification_params[:url]
    selection = clarification_params[:selection]
    
    similiar_clarifications =  Clarification.check_for_similar(url, selection)
    # @clarification = Clarification.new(clarification_params)

    if @clarification.save
      render json: @clarification, status: :created, location: @clarification
    else
      render json: @clarification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clarifications/1
  def update
    if @clarification.update(clarification_params)
      render json: @clarification
    else
      render json: @clarification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clarifications/1
  def destroy
    @clarification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clarification
      @clarification = Clarification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clarification_params
      params.require(:clarification).permit(:url, :selection, :state)
    end
end
