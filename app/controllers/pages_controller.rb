class PagesController < ApplicationController
  has_widgets do |root|
    root << widget(:sticky)
  end

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
