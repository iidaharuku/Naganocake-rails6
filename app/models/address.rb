class Address < ApplicationRecord
  belongs_to :end_user

  validates :postal_code, presence: true
  validates :place, presence: true
  validates :name, presence: true
  validates :end_user_id, presence: true

  def address_display
    '〒' + postal_code + ' ' + place + '　' + name
  end
end
