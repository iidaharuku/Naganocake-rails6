class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :last_name, presence: true
  validates :last_kana_name, presence: true
  validates :first_name, presence: true
  validates :first_kana_name, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true
end
