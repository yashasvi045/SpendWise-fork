module Api
  module V1
    class TransactionsController < ApiController
      before_action :set_budget
      before_action :set_transaction, only: [:show, :update, :destroy]

      # GET /api/v1/budgets/:budget_id/transactions
      def index
        transactions = @budget.transactions
        render json: transactions, status: :ok
      end

      # POST /api/v1/budgets/:budget_id/transactions
      def create
        transaction = @budget.transactions.new(transaction_params)
        if transaction.save
          render json: transaction, status: :created
        else
          render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/budgets/:budget_id/transactions/:id
      def show
        render json: @transaction, status: :ok
      end

      # PATCH/PUT /api/v1/budgets/:budget_id/transactions/:id
      def update
        if @transaction.update(transaction_params)
          render json: @transaction, status: :ok
        else
          render json: { errors: @transaction.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/budgets/:budget_id/transactions/:id
      def destroy
        @transaction.destroy
        head :no_content
      end

      private

      def set_budget
        @budget = Budget.find(params[:budget_id])
      end

      def set_transaction
        @transaction = @budget.transactions.find(params[:id])
      end

      def transaction_params
        params.require(:transaction).permit(:name, :amount, :category_id)
      end
    end
  end
end
