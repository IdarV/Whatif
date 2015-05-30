require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    sign_in(users(:one))
    @user = users(:one)
    @admin = users(:admin)
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
      post :create, user: {name: 'frode', :email => 'wa@wa.wa', password: psw, password_confirmation: psw}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show own user" do
    get :show, id: @user
    assert_response :success
  end

  test "should not show another user" do
    get :show, id: @admin
    assert_redirected_to '/'
  end

  test "admin should show own user" do
    sign_out(@user)
    sign_in(@admin)
    get :show, id: @admin
    assert_response :success
  end

  test "admin should show another user" do
    sign_out(@user)
    sign_in(@admin)
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "user should update own user" do
    patch :update, id: @user, user: {answered: @user.answered, common: @user.common, name: @user.name, picture: @user.picture}
    assert_redirected_to user_path(assigns(:user))
  end

  test "user should not update another user" do
    patch :update, id: @admin, user: {answered: @user.answered, common: @user.common, name: @user.name, picture: @user.picture}
    assert_redirected_to '/'
  end

  test "admin should update own user" do
    sign_out(@user)
    sign_in(@admin)
    patch :update, id: @admin, user: {answered: @user.answered, common: @user.common, name: @user.name, picture: @user.picture}
    assert_redirected_to user_path(assigns(:user))
  end

  test "admin should update another user" do
    sign_out(@user)
    sign_in(@admin)
    patch :update, id: @user, user: {answered: @user.answered, common: @user.common, name: @user.name, picture: @user.picture}
  end

  test "normal user should not destroy users" do
    assert_difference('User.count', 0) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "admin user be able to destroy users" do
    sign_out(@user)
    sign_in(@admin)
    assert_difference('User.count', -1) do
      delete :destroy, id: @admin
    end
    assert_redirected_to users_path
  end
end
