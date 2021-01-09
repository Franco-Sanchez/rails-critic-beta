class AddApproveToCritics < ActiveRecord::Migration[6.0]
  def change
    add_column :critics, :approve, :boolean, default: false
  end
end
