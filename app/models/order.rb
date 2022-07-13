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
  enum status: { 入金待ち: '0', 入金確認: '1', 制作中: '2', 発送準備中: '3', 発送済み: '4'}
end
