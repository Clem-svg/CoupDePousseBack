# frozen_string_literal: true

class Garden < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :favorites, dependent: :destroy
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  has_one_attached :picture

  validates :title, presence: true, length: {in: 5..100}
  validates :description, presence: true, length: {in: 20..1000}
  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def address
    [street_number, street_name, zip_code, city, country].compact.join(", ")
  end

  def self.search(query)
    if query
      where(city: query)
    else
      Garden.all
    end
  end
end
