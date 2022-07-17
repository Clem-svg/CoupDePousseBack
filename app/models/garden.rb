class Garden < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { in: 5..100 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :street_number, presence: true
    validates :street_name, presence: true
    validates :zip_code, presence: true
    validates :city, presence: true
    validates :country, presence: true
end
