class StaticContentController < ApplicationController
  skip_before_action :authorize, :only => :start
  def start
  end

  def about
  end

  def help
  end
end
