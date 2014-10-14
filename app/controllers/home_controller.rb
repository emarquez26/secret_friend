class HomeController < ApplicationController
  def index
    redirect_to({ action: 'new', controller: 'users' })
  end
end
