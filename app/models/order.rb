class Order < ApplicationRecord

  belongs_to :end_user

  validates :end_user_id, presence: true
  validates :postal_code, presence: true
  validates :send_address, presence: true
  validates :address_name, presence: true
  validates :pay_way, presence: true
  validates :postage, presence: true
  validates :total_cost, presence: true
  validates :status, presence: true ,default: 0

end
