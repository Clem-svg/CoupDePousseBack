class Appointment < ApplicationRecord
    belongs_to :guest, class_name: "User"
    belongs_to :host, class_name: "User"
    belongs_to :garden
  
    validates_presence_of :start_date, :end_date
    validate :start_must_be_before_end_date
    validate :start_in_future
    # after_create :new_app_guest, :new_app_host
    validate :no_appointment_overlap
    # before_destroy :destroy_app_guest, :destroy_app_host
  
  
    # # emails methods
  
    # def new_app_guest
    #   AppointmentMailer.new_app_guest(self).deliver_now
    # end
  
    # def new_app_host
    #   AppointmentMailer.new_app_host(self).deliver_now
    # end
  
    # def destroy_app_guest
    #   AppointmentMailer.delete_app_guest(self).deliver_now
    # end
  
    # def destroy_app_host
    #   AppointmentMailer.delete_app_host(self).deliver_now
    # end
  
  
  
  
    # front methods
  
  
    def show_start_date
      self.start_date.strftime('%d/%m/%Y à %H:%M')
    end
  
  
    def start_day
      self.start_date.strftime('%d/%m/%Y')
    end
  
  
    def start_hour
      self.start_date.strftime('%H:%M')
    end
  
  
    def show_end_date
      self.end_date.strftime('%d/%m/%Y à %H:%M')
    end
  
  
    def no_appointment_overlap
      if (Appointment.where("(? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date) AND garden_id = ?", self.start_date, self.end_date, self.garden_id).any?)
         errors.add(:date_end, 'Le jardin est déjà reservé pour ces dates')
      end
    end
  
    private
  
    def start_must_be_before_end_date
        errors.add(:start_date, "doit être avant la date de fin") unless
          self.start_date < self.end_date
    end
  
    def start_in_future
      errors.add(:start_date, ": Impossible de réserver un rendez-vous dans le passé") unless start_date > DateTime.now
    end
  
  end