class Api::V1::AuctionsController < ApplicationController

 before_action :authenticate_user!
  before_action :find_auction, only: [ :show, :destroy ]

  # /api/v1/questions
  def index
    # Use .includes(:user) to load all the associated
    # users with one query instead of one per question.
    auctions = Auction.includes(:user).order(created_at: :desc)
    render json: auctions, each_serializer: AuctionCollectionSerializer
  end

  def show
    render json: @auction
  end

  def create
    auction = Auction.new auction_params
    auction.user = current_user

    auction.save!
    render json: { id: auction.id }
  end

  def destroy
    @auction.destroy
    head :ok
  end

  # def update
  #   if @question.update question_params
  #     render json: { id: @question.id }
  #   else
  #     render json: { errors: @question.errors }
  #   end
  # end

  private
  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :body)
  end
end
