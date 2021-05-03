class HealthCheckController < ApplicationController

  def index
    user_count = User.count
    render plain: "User count: #{user_count}"
  end
end
