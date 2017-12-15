ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Orders" do
          table do
            tr do
              th "Order ID"
              th "Title"
              th "Upc Code"
              th "User"
              th "Price"
              th "Order Date"
              th "Status"
              th "Action"


            end
            Order.recent.map do |order|
              tr do
                td order.id, class: 'id'
                td link_to(order.title, admin_order_path(order), class: "title")
                td order.upc_code, class:'upc_code'
                td link_to(order.user.email, admin_user_path(order.user), class: 'email')
                td number_to_currency(order.price), class: "price"
                td order.created_at
                td order.status, class: order.status =='pending' ? 'status pending' : 'status shipped'
                td order.status == "pending" ? link_to("Ship Item","#",class:'shipping') : "Shipping"
              end
            end
          end
        end
      end

      column do
        panel "Most Popular Items" do
          table do
              tr do
                th "Title"
                th "UPC Code"
                th "Items Sold"
              end
            Order.popular.map do |order|
              tr do
                td order.title
                td order.upc_code
                td order.count
              end
            end
          end
        end
      end
    end
  end # content
end
