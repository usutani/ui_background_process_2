class Convert < ApplicationRecord
  has_one_attached :in_file
  has_one_attached :out_file

  enum status: {
    waiting: 0,
    validating: 1,
    converting: 2,
    succeeded: 3,
    failed: 4
  }

  after_create_commit -> { broadcast_append_later_to :convert }
  after_update_commit -> { broadcast_replace_later_to :convert }

  validates :in_file, presence: true

  def status_summary
    "#{id}:#{status}"
  end
end
