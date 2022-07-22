class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  has_many :gardens
  has_many :appointments, through: :gardens
  has_many :guest, foreign_key: "guest_id", class_name: "Appointment"
  has_many :host, foreign_key: "host_id", class_name: "Appointment"
  has_many :favorites, :dependent => :destroy

  has_many :messages, dependent: :destroy

    # méthode d'identification issue de la documentation Devise
    def self.authenticate(email, password)
      user = User.find_for_authentication(email: email)
      user&.valid_password?(password) ? user : nil
    end

end
