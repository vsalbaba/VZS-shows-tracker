class Show < ActiveRecord::Base
  attr_accessible :name, :date, :meet_time, :end_time,
                  :payed_hours, :people, :meet_at, :contact, :breakfast,
                  :lunch, :dinner, :notes, :description, :paid

  default_scope :order => :date

  validates_presence_of :name, :date

  has_many :users, :through => :subscriptions
  has_many :subscriptions
  HOUR_RATE = 30

  def subscribed_count
    self.subscriptions.find_all_by_subscribed(true).size
  end

  def pay
    payed_hours.to_i * HOUR_RATE
  end
end

