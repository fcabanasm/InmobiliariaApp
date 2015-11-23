class ApartmentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show, :index]
  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.paginate(page:params[:page], per_page:6).publicados.ultimos
    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
    end
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
    3.times {@apartment.pictures.build} # added this
  end

  # GET /apartments/1/edit
  def edit
    @apartment = Apartment.find(params[:id])
    3.times { @apartment.pictures.build } # ... and this
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = current_user.apartments.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @apartment.pictures.create(image: image)
          }
        end
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    @apartment.publish!
    redirect_to :back
  end

  def unpublish
    @apartment.unpublish!
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:cod_apartment, :title, :description,:address, :latitude, :longitude, :user_id, :is_rented, :rooms, :bathrooms, :price,:pictures)
    end
end
