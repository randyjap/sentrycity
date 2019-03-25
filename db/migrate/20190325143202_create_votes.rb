class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, index: true, polymorphic: true
      t.references :user, index: true
      t.decimal :vote, null: false, precision: 1

      t.timestamps
    end

    add_index :votes, [:votable_id, :votable_type, :user_id]
  end
end
