class Reservation < ActiveRecord::Base
  # attr_accessible :credit_card_num, :departure_date, :flight_id, :user_id

  belongs_to :user
  belongs_to :flight

  validate :valid_credit_card_num

  def valid_credit_card_num
    unless credit_card_num.starts_with?('4') && credit_card_num.length == 16
      errors.add(:credit_card, 'must be Visa')
    end
  end

  def formatted
    reservation = ""
    reservation << "Flight ##{self.flight.number}. "
    reservation << self.departure_date.strftime('%m/%e/%y')
    flight = self.flight
    reservation <<  " #{flight.departure_airport.code} - "
    reservation << flight.arrival_airport.code
    reservation << " #{flight.departs_at.strftime('%l:%M%p')} -"
    reservation << flight.arrives_at.strftime('%l:%M%p')
    return reservation
  end
end





