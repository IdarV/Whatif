class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def answeredquestion

  end

  def randomquestion
    unless params['lastquestion'].nil?
      update_database
      @commonpercent = get_common_percent
      @lastquestion = get_what_if_sentence(Question.find(params['lastquestion']))
    end
    @question = Question.order("RANDOM()").first
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:total_taken, :yes, :no, :whatif, :but, :author_name)
  end

  def update_database
    unless params['lastquestion'].nil?
      answeredquestion = Question.find(params['lastquestion'])
      buttonpressed = params['button']
      unless buttonpressed.nil?
        update_user_answered
        if buttonpressed == 'yes'
          answeredquestion.increment!(:yes, 1)
          if answeredquestion.yes > answeredquestion.no
            update_user_commons
          end
        else
          answeredquestion.increment!(:no, 1)
          if (answeredquestion.no > answeredquestion.yes)
            update_user_commons
          end
        end
        answeredquestion.increment!(:total_taken, 1)
      end
    end
  end

  def update_user_answered
    current_user.increment!(:answered, 1)
  end

  def update_user_commons
    current_user.increment!(:common, 1)
  end

  def get_common_percent
    question = Question.find(params['lastquestion'])
    buttonpressed = params['button']
    if buttonpressed == 'yes'
      'You answered yes, among with ' + ('%.2f' % (100*(question.yes.to_f/(question.total_taken)))).to_s + '% of users.'
    else
      'You answered no, among with ' + ('%.2f' % (100*(question.no.to_f/(question.total_taken)))) + '% of users.'
    end
  end

  def get_what_if_sentence(question)
    'What if ' + question.whatif + ' but ' + question.but
  end
end
