require 'faraday'
class Items::GetBookService
  API_KEY = ENV['API_KEY']
  BASE_URL = 'http://localhost:3000/api/v1/'

  def initialize
  end

  def fetchBook(id)
    book_endpoint = "books/#{id}"
    api_call(book_endpoint)
  end

  def fetchBooks
    book_endpoint ='books'
    api_call(book_endpoint)
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
