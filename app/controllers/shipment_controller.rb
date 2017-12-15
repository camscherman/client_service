class ShipmentController < ApplicationController
  def create
    service = Shipment::MakeShipmentService.new(shipment_params)
    service.submitShipment
  end

  private
  def shipment_params
    params.require(:shipment).permit(:email, :upc_code, :client_order_id)
  end
end
