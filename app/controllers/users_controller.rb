class UsersController < ApplicationController
  before_filter :login_required
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end

  def shows
    
  end

  def stats
    @user = User.find params[:id]
    @from_date = parse_date(params[:from_date])
    @to_date = parse_date(params[:to_date]) || Date.current
    @statistic = Statistic.new @user, :from => @from_date, :to => @to_date
    @shows = @statistic.shows
  end

  private
  def parse_date datestring
     Date.strptime(datestring, '%d. %m. %Y') if datestring.present?
  end
end
