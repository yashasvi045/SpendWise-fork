class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :financial_goal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
