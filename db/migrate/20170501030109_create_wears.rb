class CreateWears < ActiveRecord::Migration
  def change
    create_table :wears do |t|
        t.integer    :user_id
        t.text        :text
        t.text        :image
        t.integer    :category_id
        t.timestamps

    end
  end
end
