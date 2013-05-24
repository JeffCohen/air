class Reservation < ActiveRecord::Base
  attr_accessible :credit_card_num, :departure_date, :flight_id, :user_id

  validate :valid_credit_card_num

  def valid_credit_card_num
    unless credit_card_num.starts_with?('4') && credit_card_num.length == 16
      errors.add(:credit_card, 'must be Visa')
    end
  end
end
