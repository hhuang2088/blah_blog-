class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index 
    @tweets = Tweet.all 
  end

  def new 
    @tweet = Tweet.new 
  end

  def create 
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to @tweet
  end

  def show 
  end

  def edit 
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet 
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private 

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params 
    params.require(:tweet).permit(:title, :description)
  end
end
