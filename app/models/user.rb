class User < ActiveRecord::Base
  # attr_accessible :email, :ff_miles, :first_name, :last_name, :password, :password_confirmation

  has_secure_password

  has_many :reservations

  def calc_miles
    distances = []
    self.reservations.each do |reservation|
      distances << reservation.flight.distance
    end
    sum_of_distances = 0
    distances.each do |distance|
      sum_of_distances += distance
    end

    return sum_of_distances

    # alternate code:
    # self.reservations.map {|reservation| reservation.flight.distance}.inject{|sum, x| sum + x}
  end

end
