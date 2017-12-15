require 'faraday'

API_KEY = ENV['API_KEY']
BASE_URL = 'http://localhost:3000/api/v1/'


class Shipments::MakeShipmentService


  def initialize (params)
    @shipment_params = params.to_unsafe_hash
    @order = Order.find(@shipment_params[:shipment][:client_order_id])
  end





  def submitShipment
      @order.update({status: "shipped"})
      api_call('shipments', @shipment_params)
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
