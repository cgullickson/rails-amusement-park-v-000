class AttractionsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      @attraction.save
    end
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name,:nausea_rating,:happiness_rating,:min_height,:tickets)
  end

  def require_admin
    return redirect_to(controller: 'attractions', action: 'index') unless current_user.admin
  end

end
