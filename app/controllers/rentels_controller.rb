class RentelsController < ApplicationController
  def index
    @books =Book.all
  end
  def addtocart
    @rentel =Bookissue.new
    @rentel.issue_date=Time.now.strftime("%d/%m/%Y")
    @rentel.rentel_id=current_user.type_id_id
    @rentel.book_id=params[:b_id]
    if @rentel.save
       redirect_to rentels_path 
   else
     puts "rentel was not created sucessfull"
   end

  end

  def new
    @rentel =Rentel.new
    @rentel.build_user
  end

  def edit
    @rentel =Rentel.find(params[:id])
  end
  def update
    @rentel = Rentel.find(params[:id])   
    if @rentel.update_attributes(rentel_params)   
      flash[:notice] = 'rentel updated!'   
      redirect_to  rentels_path
    else   
      flash[:error] = 'Failed to edit rentel!'   
      render :edit   
    end   
  end
  def destroy
    @rentel = Rentel.find(params[:id])   
    if @rentel.delete   
      flash[:notice] = 'rentel deleted!'   
      redirect_to rentels_path   
    else   
      flash[:error] = 'Failed to delete this rentel !'   
      render :destroy   
    end   

  end
  def create
   @rentel =Rentel.new(rentel_params)
    if @rentel.save
        UserMailer.with(user: @rentel).welcome_email.deliver_now
       redirect_to new_user_session_path  
   else
     puts "rentel was not created sucessfull"
   end
  end

  private
  def rentel_params
    params.require(:rentel).permit(:name, :phone, :address, user_attributes: [:id, :email, :password, :password_confirmation ])
  end
end
