class BooksController < ApplicationController
  def index
    @books = Book.paginate(:page => params[:page], per_page: 3)

  end
  def new
    @book =Book.new
  end

  def edit
    @book =Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])   
    if @book.update_attributes(book_params)   
      flash[:notice] = 'book updated!'   
      redirect_to  libraryans_path
    else   
      flash[:error] = 'Failed to edit book!'   
      render :edit   
    end   
  end
  def destroy
    @book = Book.find(params[:id])   
    if @book.delete   
      flash[:notice] = 'book deleted!'   
      redirect_to libraryans_path   
    else   
      flash[:error] = 'Failed to delete this libraryan !'   
      render :destroy   
    end   

  end
  def create
   
   @book =Book.new(book_params)
    if @book.save
       redirect_to libraryans_path   
   else
    puts "book was not created sucessfull"
   end
  end

  def issue
    book = Book.find_by(id: params[:id])
    issue_book = book.bookissues.new
    issue_book.rentel_id = current_user.type_id_id
    issue_book.issue_date = DateTime.current.to_date
    issue_book.save
    redirect_to bookissues_index_path
    # @bookissues =Bookissue.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:book_name, :author_name, :title,:price,:avatar)
  end
end


