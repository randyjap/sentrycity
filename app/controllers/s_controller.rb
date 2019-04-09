class SController < ApplicationController
  def index
    @stores = Store.all
  end
end
