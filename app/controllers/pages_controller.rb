class PagesController < ApplicationController
  include UsersHelper

  def home
    @title = "Home"

    @columns = Column.all(:order => "column_order")
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end
