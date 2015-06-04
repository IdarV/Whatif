require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test 'question column names' do
    columns = %w[id total_taken yes no created_at updated_at whatif but user_id]
    assert_equal columns, Question.column_names
  end

  test 'default values should be set' do
    q = Question.new
    q.save!
    assert_equal 0, q.total_taken, 'total taken should be 0 by default'
    assert_equal 0, q.yes, 'yes should be 0 by default'
    assert_equal 0, q.no, 'no should be 0 by default'
    assert_nil q.whatif, 'whatif should be null'
    assert_nil q.but, 'but should be null'
    assert 1.hour.ago < q.created_at, 'created at should be a bigger number than one hour ago'
    assert 1.hour.ago < q.updated_at, 'updated at should be a bigger number than one hour ago'
  end

  test 'updated at should increment' do
    q = Question.new
    q.save!
    before_update = q.updated_at
    q.whatif = 'what_if_clause'
    q.but = 'but_clause'
    q.save!
    assert q.updated_at > before_update, 'new updated_at value should be higher than before the update'
  end




end
