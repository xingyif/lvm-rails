# Most of the User functionality comes from devise. This is just extra stuff.

class UsersController < ApplicationController
  before_action :ensure_admin!

  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'User Accounts'

    @new_button = {
      text: 'Create New user',
      url: new_user_path
    }
    @clickable_rows = true
    @page_title = 'User Accounts'
    @models = User.all
    @headers = [
      'Email Address',
      'Role',
      'Last Signed In',
      'Created On'
    ]
    @columns = [
      'email',
      'role_string',
      'last_sign_in_string',
      'created_at_string'
    ]
  end

  def show
    add_breadcrumb 'User Accounts', users_path
    add_breadcrumb 'User Account'

    @user = User.find(params[:id])
  end

  def new
    add_breadcrumb 'User Accounts', users_path
    add_breadcrumb 'New User Account'

    @role_options = [
      ['Tutor', 0],
      ['Coordinator', 1],
      ['Admin', 2]
    ]
    @tutors = Tutor.all.order(:first_name)
    @coordinators = Coordinator.all.order(:first_name)

    @user = User.new
  end

  def edit
    add_breadcrumb 'User Accounts', users_path
    add_breadcrumb 'Edit User Account'

    @role_options = [
      ['Tutor', 0],
      ['Coordinator', 1],
      ['Admin', 2]
    ]
    @tutors = Tutor.all.order(:first_name)
    @coordinators = Coordinator.all.order(:first_name)
    @user = User.find(params[:id])
  end

  def create
    @tutors = Tutor.all.order(:first_name)
    @coordinators = Coordinator.all.order(:first_name)

    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      # This is bad, but there's a bug where if we rerender 'new', which is
      # what we want to do, then all of the dropdowns turn into inputs, which
      # is decidedly worse.
      redirect_to new_user_path, alert: "Looks like your passwords didn't\
      match. Sorry about that. ):"
    end
  end

  def update
    @user = User.find(params[:id])

    prms = if user_params[:password_confirmation] == ''
             user_params.except(:password, :password_confirmation)
           else
             user_params
           end

    if @user.update(prms)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :coordinator_id,
      :email,
      :password,
      :password_confirmation,
      :role,
      :tutor_id
    )
  end
end
