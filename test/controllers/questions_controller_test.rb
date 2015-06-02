require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    sign_in(users(:one))
    @admin = users(:admin)
    @user = users(:one)
    @question = questions(:one)
  end

  test "user should not get index" do
    get :index
    assert_response :redirect
    assert_not_nil assigns(:questions)
  end

  test "admin should get index" do
    sign_out(@user)
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { no: @question.no, total_taken: @question.total_taken, yes: @question.yes }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { no: @question.no, total_taken: @question.total_taken, yes: @question.yes }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
