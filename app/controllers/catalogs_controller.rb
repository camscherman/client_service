class CatalogsController < ApplicationController
  def index
    service = Items::GetCatalogService.new
    @catalogs = service.fetchCatalogs
    # render json: @catalogs


  end

  def show
    service = Items::GetCatalogService.new
    @catalog = service.fetchCatalog(params[:id])
    # render json: @catalog
  end

end
