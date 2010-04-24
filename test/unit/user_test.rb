require 'test_helper'
require 'open-uri'
class UserTest < ActiveSupport::TestCase

  Factory(:user)

  should_validate_presence_of :vzs_id
  should_validate_uniqueness_of :vzs_id

  context 'vzs.trebic.cz' do
    setup do
      @password = 'testtest'
    end

    should 'return xml with tag user for valid credentials' do
      url = User.send(:build_url_for, '915', 'testtest')
      xml = open url
      doc = Nokogiri::XML xml
      assert doc.search('error').empty?
      assert !doc.search('user').empty?
    end
  end

  context 'authentication' do
    setup do
      @me = Factory.build(:user, :vzs_id => '915')
      @password = 'testtest'
    end

    context 'User.authenticate' do
      should 'create user if trebic.vzs.cz responds to id and password_hash' do
        User.authenticate('915', 'testtest')
        assert User.find_by_vzs_id(@me.vzs_id)
      end

      should 'find an existing user if trebic.vzs.cz responds to id and password_hash' do
        user = Factory :user, :name => 'Uživatel', :surname => 'Testovací', :vzs_id => '915'
        assert_equal user.id, User.authenticate(user.vzs_id, 'testtest').id
      end

      should 'return nil with invalid credentials' do
        assert_nil User.authenticate(@me.vzs_id, 'bad_password')
        assert_nil User.authenticate('bad_login', 'some_password')
      end
    end

    context 'User.find_or_create_from_xml' do
      setup do
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.user {
            xml.name 'Uživatel'
            xml.surname 'Testovací'
            xml.role '4'
          }
        end
        @xml = builder.to_xml
        @error = Nokogiri::XML::Builder.new { |xml|
          xml.error 'Invalid request!'
        }.to_xml
      end

      should 'update user if data are new' do
        Factory(:user, :vzs_id => '915', :name => 'Pavel')
        user = User.find_or_create_from_xml('915', @xml)
        old_user = User.find_by_vzs_id('915')
        assert_equal 'Uživatel', old_user.name
      end

      should 'create user from Nokogiri XML Tree' do
        logger.debug User.all
        user = User.find_or_create_from_xml('915', @xml)
        assert_equal 'Uživatel', user.name
        assert_equal 'Testovací', user.surname
        assert_equal 4, user.auth_level
        assert_equal '915', user.vzs_id
      end

      should 'find a user if there is one' do
        user_in_database = Factory(:user, :vzs_id => '915')
        found_user = User.find_or_create_from_xml('915', @xml)
        assert_equal user_in_database.id, found_user.id
      end

      should 'return nil if there is none.' do
        assert_nil User.find_or_create_from_xml('asdfasdfasf', @error)
      end
    end
  end
end

