class CreatePromptLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :prompt_letters do |t|

      t.timestamps
    end
  end
end
