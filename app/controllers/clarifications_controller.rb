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
    url = clarification_params[:url]
    selection = clarification_params[:selection]
    
    @similiar_clarifications =  Clarification.check_for_similar(url, selection)

    if @similiar_clarifications.empty?
      p "didn't find anything"
      #here a new ticket request should be made for an expert to go out and find a clarification solution.
      @clarification = Clarification.new(clarification_params)
      if @clarification.save
        render json: @clarification.responses, status: :created, location: @clarification
      else
        render json: @clarification.errors, status: :unprocessable_entity
      end
    else
      p "found something"
      @responses = @similiar_clarifications.map(&:responses).flatten
      #should return the clarification resources that exist for this text in ranked order.
      render json: @responses
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
