class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  
  enum create_status: [:unable, :wait_producing , :produce, :finish]
end
