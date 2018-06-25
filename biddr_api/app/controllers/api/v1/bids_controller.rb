class Api::V1::BidsController < ApplicationController
  before_action :authenticate_user!
  # CAUTION! Permissions are not implemented in this
  # controller. You should!

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new bid_params
    @bid.auction = @auction
    @bid.user = current_user

    @bid.save!
    render json: { id: bid.id }
  end

  private
  def find_bid
    @bid = Bid.find params[:id]
  end

  def bid_params
    params.require(:bid).permit(:amount)
  end

end

# def create
#   @question = Question.find(params[:question_id])
#   @answer = Answer.new(answer_params)
#   @answer.question = @question
#   @answer.user = current_user

  
#   if @answer.save
#     @question.answer! if @question.may_answer?
#     if @question.user.present?
#       # This sends mail synchronously which
#       # will block your rails process:
#       # AnswerMailer
#       #   .notify_question_owner(@answer)
#       #   .deliver_now

#       # This sends asynchronously using the
#       # job queue which is preferable
#       # to sending it synchronously.
#       AnswerMailer
#         .notify_question_owner(@answer)
#         .deliver_later(wait: 1.second)
#     end

#     redirect_to question_path(@question)
#   else
#     @answers = @question.answers.order(created_at: :desc)
#     render "questions/show"
#   end
# end