class CreatePromptScores < ActiveRecord::Migration[7.0]
  def change
    create_table :prompt_scores do |t|
      t.string :ip_address
      t.integer :time_spent_in_seconds
      t.references :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
