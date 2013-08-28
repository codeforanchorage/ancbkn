class CrimesController < ApplicationController
  # GET /crimes
  # GET /crimes.json
  def index
    @crimes = Crime.all

    render json: @crimes
  end

  # GET /crimes/1
  # GET /crimes/1.json
  def show
    @crime = Crime.find(params[:id])

    render json: @crime
  end

  # POST /crimes
  # POST /crimes.json
  def create
    @crime = Crime.new(crime_params)
    logger.info(crime_params)

    if @crime.save
      render json: @crime, status: :created, location: @crime
    else
      render json: @crime.errors, status: :unprocessable_entity
    end
  end

  def bulk
    crimes_params.each do |i|
      Crime.create(i[:crime])
    end
  end

  # PATCH/PUT /crimes/1
  # PATCH/PUT /crimes/1.json
  def update
    @crime = Crime.find(params[:id])

    if @crime.update(params[:crime])
      head :no_content
    else
      render json: @crime.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crimes/1
  # DELETE /crimes/1.json
  def destroy
    @crime = Crime.find(params[:id])
    @crime.destroy

    head :no_content
  end
end

private
  def crime_params
    params.require(:crime).permit(:code, :name, :lat, :lng, :rawDateFormat, :reportNumber, :incidentTime, :street)
  end

  def crimes_params
    params.require(:crimes)
  end

