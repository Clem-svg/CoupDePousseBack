# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validate :password_complexity
  has_many :gardens
  has_many :appointments, through: :gardens
  has_many :comments, through: :gardens
  has_many :guest, foreign_key: "guest_id", class_name: "Appointment"
  has_many :host, foreign_key: "host_id", class_name: "Appointment"
  has_many :favorites, dependent: :destroy
  has_many :sender, foreign_key: "sender_id", class_name: "ChatRoom"
  has_many :receiver, foreign_key: "receiver_id", class_name: "ChatRoom"
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :avatar

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, 
    'Le mot de passe doit contenir au moins 8 caractères. Il doit inclure au moins une majuscule, une minuscule, un chiffre et un caractère spécial.'
  end
  
  # méthode d'identification issue de la documentation Devise
  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) ? user : nil
  end



  def get_username
    if username.empty?
      return email.split("@")[0]
    else
      return username
    end
  end
end
