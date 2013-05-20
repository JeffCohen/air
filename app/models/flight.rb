class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport_id, :arrives_at, :departs_at, :departure_airport_id, :duration, :miles, :number, :seats

  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

  def minutes
    return "#{(arrives_at - departs_at).to_i/60} minutes"
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










