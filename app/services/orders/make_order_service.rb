require 'faraday'

API_KEY = ENV['API_KEY']
BASE_URL = 'http://localhost:3000/api/v1/'
PST_RATE = 0.07
GST_RATE = 0.05

class Orders::MakeOrderService
  attr_reader :pst, :gst, :subtotal, :total, :title, :id

  def initialize (book_id, user)
    @id = book_id
    @user = user
    @pst = nil
    @gst = nil
    @total = nil
    @title = nil
    @upc_code = nil
    @subtotal = nil

  end

  def calculateTotal
    book_service = Items::GetBookService.new
    @book = book_service.fetchBook(@id)
    @title = @book[:title]
    @subtotal = @book[:price]
    @upc_code = @book[:upc_code]
    @pst = @subtotal*PST_RATE
    @gst = @subtotal*GST_RATE
    @total = @subtotal + @pst + @gst
  end

  def createOrder
    Order.create({title: @title, upc_code: @upc_code, price: @total, user_id: @user[:id]})
    sendOrderToApi
  end

  def sendOrderToApi
    params = { order: { upc_code: @upc_code , user_email: @user.email }}
    api_call('orders', params)
  end

  private
  def api_call (endpoint, params)
    conn = Faraday.new url: BASE_URL
    response = conn.post do |req|
      req.url endpoint
      req.headers['API_KEY'] = API_KEY
      req.params = params
    end
  end
end
