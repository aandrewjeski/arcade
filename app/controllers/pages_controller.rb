class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def charts
    @user = current_user
  end
end
