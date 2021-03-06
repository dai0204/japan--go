class TweetsController < ApplicationController

   before_action :move_to_index, except: [:index,:show]


  def index
  end

 def new
 end

 def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text],prefecture: tweet_params[:prefecture], user_id: current_user.id)
 end


 def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id 
 end

 def edit
   @tweet = Tweet.find(params[:id])
 end

 def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
 end

 def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
 end

 def pre
  @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  # @pres = Tweet.where(prefecture:"1").order('id DESC').limit(5)
  # @tweets = Tweet.where(prefecture: @tweet.prefecture).order('id DESC').limit(5)
 end


  private
  def tweet_params
    params.permit(:image, :text, :prefecture)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
