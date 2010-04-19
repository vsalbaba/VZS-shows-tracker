class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :vzs_id, :password, :password_confirmation

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :vzs_id
  validates_uniqueness_of :vzs_id

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.matching_password?(pass)
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_hash = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    Digest::MD5.hexdigest(pass)
  end
end

