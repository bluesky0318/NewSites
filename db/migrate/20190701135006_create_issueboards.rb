class CreateIssueboards < ActiveRecord::Migration[5.0]
  def change
    create_table :issueboards do |t|
      t.belongs_to  :projectcontrol
      t.belongs_to  :status
      t.string      :issuesummary
      t.text        :issuedescription

      t.timestamps
    end
  end
end
