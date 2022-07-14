class Order < ApplicationRecord

  belongs_to :end_user

  validates :end_user_id, presence: true
  validates :postal_code, presence: true
  validates :send_address, presence: true
  validates :address_name, presence: true
  validates :pay_way, presence: true
  validates :postage, presence: true
  validates :total_cost, presence: true

  enum pay_way: { credit_card: '0', transfer: '1' }
  enum status: { waiting: '0', confirm: '1', producing: '2', ready_to_ship: '3', send: '4'}
end
