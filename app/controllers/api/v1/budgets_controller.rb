class Api::V1::BudgetsController < ApplicationController
  before_action :authenticate_user!
    #  before_action :set_budget, only: [:show, :update, :destroy]
    before_action :set_budget, only: [:show]

      # GET /api/v1/budgets
      def index
        #budgets = Budget.all
        #render json: budgets, status: :ok
        @budgets = current_user.budgets
      end

      # POST /api/v1/budgets
      # def create
      #   budget = Budget.new(budget_params)
      #   if budget.save
      #     render json: budget, status: :created
      #   else
      #     render json: { errors: budget.errors.full_messages }, status: :unprocessable_entity
      #   end
      # end

      # GET /api/v1/budgets/:id
      def show
        render json: @budget, status: :ok
      end

      # PATCH/PUT /api/v1/budgets/:id
      # def update
      #   if @budget.update(budget_params)
      #     render json: @budget, status: :ok
      #   else
      #     render json: { errors: @budget.errors.full_messages }, status: :unprocessable_entity
      #   end
      # end

      # DELETE /api/v1/budgets/:id
      # def destroy
      #   @budget.destroy
      #   head :no_content
      # end

      private

      def set_budget
       #@budget = Budget.find(params[:id])
       @budget = current_user.budgets.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized
      end

      # def budget_params
      #   params.require(:budget).permit(:name, :financial_goal, :user_id)
      # end
end

