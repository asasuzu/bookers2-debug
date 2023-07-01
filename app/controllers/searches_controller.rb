class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "/searches/search_result"
    else
      @books = Book.looks(params[:search], params[:word])
      render "/searches/search_result"
    end
  end
  
  def tag_search
    @tag = params[:tag]
    @books = Book.tag_looks(params[:tag])
    render "/searches/search_result"
  end

end


