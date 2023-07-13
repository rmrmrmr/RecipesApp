class CreateRecipefoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipefoods do |t|
      t.integer :quantity
      t.references :foods, index: true, foreign_key: true
      t.references :recipes, index: true, foreign_key: true
      t.timestamps
    end
  end
end
