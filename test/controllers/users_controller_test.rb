require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    sign_in(users(:one))
    @user = users(:one)
  end

  test "thisistrue" do
    assert_equal(1, 1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    psw = 'baconsauce'
    assert_difference('User.count') do
      post :create, user: {name: 'frode', :email => 'wa@wa.wa', password: psw, password_confirmation:psw}
    end

    #assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { answered: @user.answered, common: @user.common, name: @user.name, picture: @user.picture }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
