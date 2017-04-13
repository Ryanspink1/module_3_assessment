class SearchController < ApplicationController
  def index
    @stores = Store.search_best_buy(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end
end
