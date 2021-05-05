class ReviewsController < ApplicationController

    def new
        if params[:book_id] && book = Book.find_by_id(params[:_id])
            @review = review.book.build
        else
            @review = Review.new
            @review.build_book
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            @review.build_book unless @review.book
            render :new
        end
    end

    def index
        if params[:book_id] && book = Book.find_by_id(params[:book_id])
            @reviews = book.reviews 
        else
            @reviews = Review.all
        end
    end

    def show
        set_review
    end

    def edit
        set_review
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
        @review = Review.find_by_id(id: params[:id])
        if !@review
            redirect_to reviews_path
        end
    end

    def review_params
        params.require(:review).permit(:content, :rating, :book_id)
    end
end
