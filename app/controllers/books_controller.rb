class BooksController < ApplicationController
	before_action :find_book, only: [:show,:edit,:update,:destroy]  #call back 
	#before_action :set_category,shallow:true
	def index
	  if params[:category].blank?     
		@books=Book.all
		
	  else
	    @category_id=Category.find_by(name: params[:category]).id  #instance varible for category_id
	    @books=Book.where(:category_id => @category_id)     #display all books for prticular  category
	  end  	

	end	
	def new
		@book=current_user.books.build
		@categories=Category.all.map{ |c| [c.name,c.id]}
		@books=Book.all
	end
	def create
	    @book=current_user.books.build(book_params)
	    @book.category_id=params[:category_id]
	    if @book.save
	    	redirect_to books_path
	    else
	        render 'new'
	    end
	end
	def show
		@book=Book.find(params[:id])
		
	end	
	def edit
		@book=Book.find(params[:id])
		@categories=Category.all.map{ |c| [c.name,c.id]}
	end
	def update
	    @book=Book.find(params[:id])
	    if@book.update(book_params)
	      redirect_to books_path
	    else
          render 'edit'
        end
    end
    def destroy
        @book=Book.find(params[:id])
        if @book.destroy
          redirect_to books_path
        end
               
	end
	private
	  def  book_params
	     params.require(:book).permit(:title,:description,:author,:category_id,:image)
	  end 
	  def find_book
	    @book=Book.find(params[:id])
      end 
      

end
