class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb" })
  end

  def add
    # current_number_of_users = User.all.max
    n = User.new
    n.username = params.fetch("input_username")
    n.save

    redirect_to("/users/" + n.username)
  end

  def update
    user_to_update = params.fetch("path_user_id")
    @input_username_to_save = params.fetch("input_username")
    matching_user = User.where({ :id => user_to_update })
    n = matching_user.first
    n.username = @input_username_to_save
    n.save

    redirect_to("/users/" + @input_username_to_save)
  end
end
