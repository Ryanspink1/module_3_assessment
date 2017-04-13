class SearchController < ApplicationController
  def index
    @stores = Store.search_best_buy(params[:search])
  end
end
