class BookissuesController < ApplicationController
  def index
    # @bookissues = Bookissue.all
    # user = current_user.type_id.class.name == 'Libraryan' ? 
    @bookissues = Bookissue.where(rentel_id: current_user.type_id.id)
  end

  def new
    @bookissue = Bookissue.new
  end 
  def destroy
    @bookissue =Bookissue.find(params[:id])
    if @bookissue.destroy
      redirect_to bookissues_index_path
    end
  end
end
