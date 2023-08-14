class AddChecksToLog < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :checks, :json
  end
end
