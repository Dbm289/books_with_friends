class ReviewsController < ApplicationController

    before_action :check_for_logged_in, except: [:index]
    before_action :set_review, except: [:index]

    def new
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @review = @book.reviews.build
        else
            @review = Review.new
            @review.build_book
        end
    end

    def create
        @review = Review.new(review_params) 
        @book = Book.find_by_id(params[:book_id])
        #byebug
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def index
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @reviews = @book.reviews.order_by_rating
        elsif params[:user_id] && user = User.find_by_id(params[:user_id])
            @reviews = user.reviews.order_by_rating
        else
            @reviews = Review.order_by_rating
        end
    end

    def show   
    end

    def edit
    end

    def update
        set_review
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit
        end
    end

    def destroy
        set_review
        @review.destroy
        redirect_to reviews_path
    end

    private 

    def set_review
        @review = Review.find_by(id: params[:id])
        #if !@review
            #redirect_to reviews_path
        #end
    end

    def review_params
        params.require(:review).permit(:content, :rating, :book_id, :user_id, book_attributes: [:title, :author, :length, :year])
    end
end
