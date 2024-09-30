module Api
  module V1
    class CategoriesController < ApiController
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /api/v1/categories
      def index
        categories = Category.all
        render json: categories, status: :ok
      end

      # POST /api/v1/categories
      def create
        category = Category.new(category_params)
        if category.save
          render json: category, status: :created
        else
          render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/categories/:id
      def show
        render json: @category, status: :ok
      end

      # PATCH/PUT /api/v1/categories/:id
      def update
        if @category.update(category_params)
          render json: @category, status: :ok
        else
          render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/categories/:id
      def destroy
        @category.destroy
        head :no_content
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
