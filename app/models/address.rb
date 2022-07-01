class Address < ApplicationRecord
  belongs_to :end_user
  
  # validates :last_name, presence: true
end
