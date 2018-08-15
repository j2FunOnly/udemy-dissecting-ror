class GuestUser < User
  attr_accessor :name, :email, :id

  def self.build
    new.tap do |g|
      g.id = g.object_id
      g.name = 'Guest User'
      g.email = 'guest@example.com'
    end
  end
end
