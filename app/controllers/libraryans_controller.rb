class LibraryansController < ApplicationController
  def index
    @books = Book.all.paginate(:page => params[:page], per_page: 3)
    @libraryans = Libraryan.paginate(:page => params[:page], per_page: 3)
  end

  def new
    @libraryan =Libraryan.new
    @libraryan.build_user
  end

  def edit
    @libraryan =Libraryan.find(params[:id])
  end
  def update
    @libraryan = Libraryan.find(params[:id])   
    if @libraryan.update_attributes(libraryan_params)   
      flash[:notice] = 'libraryan updated!'   
      redirect_to  libraryans_path
    else   
      flash[:error] = 'Failed to edit libraryan!'   
      render :edit   
    end   
  end
  def destroy
    @libraryan = Libraryan.find(params[:id])   
    if @libraryan.delete   
      flash[:notice] = 'libraryan deleted!'   
      redirect_to libraryans_path   
    else   
      flash[:error] = 'Failed to delete this libraryan !'   
      render :destroy   
    end   

  end
  def create
   @libraryan =Libraryan.new(libraryan_params)
    if @libraryan.save
       UserMailer.with(user: @libraryan).welcome_email.deliver_now
       redirect_to new_user_session_path   
   else
    puts "libraryan was not created sucessfull"
   end
  end

  private
  def libraryan_params
    params.require(:libraryan).permit(:name, :age, :phone, user_attributes: [:id, :email, :password, :password_confirmation ])
  end
end
