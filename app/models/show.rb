class Show < ActiveRecord::Base
  attr_accessible :name, :date, :meet_time, :end_time,
                  :payed_hours, :people, :meet_at, :contact, :breakfast,
                  :lunch, :dinner, :notes, :description

  default_scope :order => :date

  validates_presence_of :name, :date

  has_and_belongs_to_many :users, :uniq => true

  HOUR_RATE = 30
  def pay
    payed_hours.to_i * HOUR_RATE
  end
end

