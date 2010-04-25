class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates_uniqueness_of :show_id, :scope => :user_id, :message => "Na ukázku jste již přihlášen"
  validate :number_of_people

  def number_of_people
    errors.add(:base, "Prilis mnoho lidi na ukazce") if self.show.users.count >= self.show.people
  end
end

