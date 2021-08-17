class MyAccountsController < ApplicationController
  def show
    @ads = current_user.ads
    authorize current_user
  end
end
