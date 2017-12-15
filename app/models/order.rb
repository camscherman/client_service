class Order < ApplicationRecord
  belongs_to :user

  def self.recent
    self.order(created_at: :desc)
  end
  
  def self.popular
      self.find_by_sql("SELECT title,upc_code, COUNT(upc_code) as count FROM orders GROUP BY upc_code, title ORDER BY count DESC")
  end
end
