class CatalogsController < ApplicationController
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]

  def index
    @catalogs = Catalog.where("approved = ?", false)
  end

  def show
    if @catalog.reviews.blank?
      @average_review = 0
    else
      @average_review = @catalog.reviews.average(:rating).round(2)
    end
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: 'Catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @catalogs = Catalog.search(params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:title, :location, :phone_number, :open_time_monday, :open_time_tuesday,
                                      :open_time_wednesday, :open_time_thursday, :open_time_friday, :open_time_saturday,
                                      :open_time_sunday, :close_time_monday, :close_time_tuesday, :close_time_wednesday,
                                      :close_time_thursday, :close_time_friday, :close_time_saturday, :close_time_sunday,
                                      :description, {photos: []}, :has_free_wifi, :category_id, :approved, :address)
    end
end
