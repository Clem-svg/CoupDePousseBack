class PagesController < ActionController::Base
    def home
        @application = Doorkeeper::Application.find_by(name: 'web Client')
    
        @application = {
          name: @application.name,
          client_id: @application.uid,
          client_secret: @application.secret
        }
      end
end
