class Show < ActiveRecord::Base
  attr_accessible :name, :date, :meet_time, :end_time,
                  :payed_hours, :people, :meet_at, :contact, :breakfast,
                  :lunch, :dinner, :notes, :description, :paid, :archived

  default_scope :order => :date
  named_scope :archived, :conditions => {:archived => true}, :order => "date DESC"
  named_scope :unarchived, :conditions => {:archived => nil}

  validates_presence_of :name, :date

  has_many :users, :through => :subscriptions
  has_many :subscriptions
  HOUR_RATE = 30

  def subscribed_count
    self.subscriptions.find_all_by_subscribed(true).size
  end

  def archive
    self.archived = true
  end

  def unarchive
    self.archived = nil
  end

  def archived?
    self.archived
  end


  def pay
    payed_hours.to_i * HOUR_RATE
  end
end

