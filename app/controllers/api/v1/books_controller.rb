module Api
  module V1
    class BooksController < ApplicationController
      include ErrorSerializer

      after_filter only: [:index] { set_pagination_header(:books) }

      def index
        @books = Book.page params[:page]

        render json: @books
      end

      def show
        @book = Book.find(params[:id])

        render json: @book
      end

      def create
        @book = Book.new(book_params)

        if @book.save
          render json: @book, status: :created, location: @book
        else
          render json: ErrorSerializer.serialize(@book.errors), status: :unprocessable_entity
        end
      end

      def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
          render json: @book, status: :ok, location: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy

        head :no_content
      end

      def book_url(book)
        "" # sooo empty
      end

      private

      def book_params
        params.require(:books).permit(:title, :description, :cover_url, :complete_date, :review_url)
      end
    end
  end
end