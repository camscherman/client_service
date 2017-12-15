class Api::V1::ShipmentsController < Api::BaseController
  before_action :authenticate_api_user!

  def create
    service = Shipments::MakeShipmentService.new(params)
    service.submitShipment
    render json: {sucess: "true"}
  end



end
