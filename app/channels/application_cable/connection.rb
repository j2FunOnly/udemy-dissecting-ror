module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user || guest_user
    end

    protected

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end

    def guest_user
      @guest_user || GuestUser.build
    end
  end
end
