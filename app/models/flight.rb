class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport_id, :arrives_at, :departs_at, :departure_airport_id, :duration, :miles, :number, :seats

  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'


  MILEAGE_HASH = {  'ORD - JFK' => 740,
                    'ORD - LAX' => 1744,
                    'ORD - SFO' => 1846,
                    'JFK - LAX' => 2475,
                    'JFK - SFO' => 2586,
                    'LAX - SFO' => 338    }


  def arrives_at
    departs_at + minutes * 60
  end

  def minutes
    self.distance/8
  end

  def distance
    a = self.arrival_airport
    d = self.departure_airport
    if Flight::MILEAGE_HASH["#{a.code} - #{d.code}"]
      return Flight::MILEAGE_HASH["#{a.code} - #{d.code}"]
    else
      return Flight::MILEAGE_HASH["#{d.code} - #{a.code}"]
    end
  end




  # def arrival_airport
  #   return Airport.find_by_id(self.arrival_airport_id)
  # end

end

# @flight.arrival_airport

# class Message
#   belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
#   belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
# end










