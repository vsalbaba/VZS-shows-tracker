class ShowsController < ApplicationController
  before_filter :login_required
  def index
    @shows = Show.all.paginate(:page => params[:page])
  end

  def join
    @show = Show.find(params[:id])
    @subscription = Subscription.new(:user_id => current_user.id, :show_id => @show.id, :subscribed => params[:subscribed])
    if @subscription.save then
      if @subscription.subscribed then
        flash[:notice] = 'Byli jste přihlášeni na ukázku. Pokud se budete chtít odhlásit, napište vedoucímu ukázky'
      else
        flash[:notice] = 'Zaznamenali jsme si, že na ukázku nemůžete jet. Svoje rozhodnutí můžete kdykoli změnit.'
      end
    else
      flash[:error] = 'Na ukázku vás nebylo možno přihlásit'
    end
    redirect_to :action => 'show'
  end

  def kick
    @show = Show.find(params[:id])
    @show.users.delete User.find(params[:user_id])
    redirect_to :action => 'show'
  end

  def show
    @show = Show.find(params[:id])
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(params[:show])
    if @show.save
      flash[:notice] = "Ukázka vytvořena"
      redirect_to @show
    else
      render :action => 'new'
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(params[:show])
      flash[:notice] = "Ukázka aktualizována"
      redirect_to @show
    else
      render :action => 'edit'
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy
    flash[:notice] = "Ukázka smazána"
    redirect_to shows_url
  end
end

