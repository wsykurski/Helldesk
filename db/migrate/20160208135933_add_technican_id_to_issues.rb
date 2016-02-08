class AddTechnicanIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :technican_id, :integer
  end
end
