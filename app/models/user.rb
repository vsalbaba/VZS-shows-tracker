class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :vzs_id, :name, :surname, :auth_level

  has_many :subscriptions
  has_many :shows, :through => :subscriptions

  validates_presence_of :vzs_id, :name, :surname, :auth_level
  validates_uniqueness_of :vzs_id

  def admin?
    self.auth_level == 1 or self.auth_level == 2
  end

  def subscribed_to?(show)
    subscription = self.subscriptions.find(:first, :conditions => {:show_id => show.id})
    if subscription then
      subscription.subscribed
    else
      nil
    end
  end

  # login can be either username or email address
  def self.authenticate(login, pass)
    url = build_url_for(login, pass)
    xml = open url
    User.find_or_create_from_xml(login, xml)
  end

  def self.find_or_create_from_xml(user_vzs_id, xml)
    doc = Nokogiri::XML xml
    return nil unless doc.search('error').empty?
    params = {
      :name => convert_to_utf8(doc.search('name').first.content),
      :surname => convert_to_utf8(doc.search('surname').first.content),
      :auth_level => convert_to_utf8(doc.search('role').first.content)
    }
    if user = User.find_by_vzs_id(user_vzs_id) then
      user.update_attributes!(params)
    else
      user = User.create(params.merge :vzs_id => user_vzs_id)
    end
    user
  end

  def full_name
    @full_name ||= "#{self.name} #{self.surname}"
  end

  private
  def self.encrypt_password(pass)
    Digest::MD5.hexdigest Iconv.conv('windows-1250', 'utf-8', pass)
  end

  def self.build_url_for(login, pass)
    "http://www.trebic.vzs.cz/authentication_proxy.php?user_id=#{login}&password_hash=#{encrypt_password(pass)}"
  end

  def self.convert_to_utf8(string)
    Iconv.conv('utf-8', 'windows-1250', string)
  end
end

