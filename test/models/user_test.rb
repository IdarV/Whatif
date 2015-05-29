require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test 'the truth' do
     assert true
   end

  test 'should not save without setting values' do
    user = User.new
    assert_not user.save
  end

  test 'should not save user where email is already saved' do
    user = users(:one)

    user2 = User.new
    user2.email=user.email
    assert_not user2.save
  end

  test 'should save with minimal values' do
    psw = Faker::Internet.password(10, 20)
    u = User.new({:name => Faker::Name.name, :email => Faker::Internet.email, :password => psw, :password_confirmation => psw})
    assert u.save!, u.errors
  end

  test 'should have default values' do
    psw = Faker::Internet.password(10, 20)
    u = User.new({:name => Faker::Name.name, :email => Faker::Internet.email, :password => psw, :password_confirmation => psw})
    assert u.save!, u.errors
  end

   test 'password length should be 8 or more characters' do
     psw = Faker::Internet.password(7, 7)
     u = User.new({:name => Faker::Name.name, :email => Faker::Internet.email, :password => psw, :password_confirmation => psw})
     assert_not u.save, u.errors

     psw = Faker::Internet.password(8, 8)
     u = User.new({:name => Faker::Name.name, :email => Faker::Internet.email, :password => psw, :password_confirmation => psw})
     assert u.save!, u.errors
   end

  test 'default values should be set' do
    user = users(:minimal)
    assert_equal 'http://res.cloudinary.com/whatifapp/image/upload/v1432836484/stranger.jpg', user.picture
    assert_equal 0, user.common
    assert_equal 0, user.answered
    assert_equal 0, user.sign_in_count
    assert_equal '', user.encrypted_password
  end

end
