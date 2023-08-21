class RenameColumnTypeToBoardTypeInBoards < ActiveRecord::Migration[7.0]
  def change
    rename_column :boards, :type, :board_type
  end
end
