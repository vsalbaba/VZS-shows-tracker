class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates_uniqueness_of :show_id, :scope => :user_id, :message => "Na ukázku jste již přihlášen"
  validate :number_of_people

  named_scope :subscribed, :conditions => { :subscribed => true }
  named_scope :not_subscribed, :conditions => { :subscribed => false }

  default_scope :order => 'created_at'


  def number_of_people
    errors.add(:base, "Prilis mnoho lidi na ukazce") if self.subscribed and self.show.people and (self.show.subscribed_count >= self.show.people)
  end
end

