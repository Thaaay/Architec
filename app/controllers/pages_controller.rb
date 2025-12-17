class PagesController < ApplicationController
  def home
    @projects = Project.limit(4)
  end

  def contact
  end

  def studio
  end
end