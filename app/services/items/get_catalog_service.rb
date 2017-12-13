require 'faraday'
class Items::GetCatalogService
  API_KEY = ENV['API_KEY']
  BASE_URL = 'http://localhost:3000/api/v1/'

  def initialize
  end

  def fetchCatalogs
    api_call('catalogs')
  end

  def fetchCatalog(id)
    catalog_endpoint = "catalogs/#{id}"
    api_call(catalog_endpoint)
  end



  private

  def api_call(endpoint)
    conn = Faraday.new url: BASE_URL
    response = conn.get do |req|
      req.url endpoint
      req.headers['API_KEY'] = API_KEY
    end
    return JSON.parse(response.body, symbolize_names: true)
  end
end
