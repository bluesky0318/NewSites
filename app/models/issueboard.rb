class Issueboard < ApplicationRecord
  validates_presence_of   :issuesummary, :message => "Issue summary cannot be blank"
  validates_presence_of   :issuedescription, :message => "Comment cannot be blank"
  serialize   :cclist

  has_many    :issuefiles
  has_many    :issuecclists
  has_many    :issuecomments
  has_many    :issuereleaserelates
  
  belongs_to  :projectcontrol
  belongs_to  :status
  belongs_to  :statussolution
  belongs_to  :assignedto, :class_name => "User"#, :foreign_key => "assignedto_id"
  belongs_to  :reporter, :class_name => "User"#, :foreign_key => "reporter_id"
  belongs_to  :customerlist
  belongs_to  :bugreason
end
