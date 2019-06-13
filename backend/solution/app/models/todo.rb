class Todo < ApplicationRecord
	validates :title, presence: true, length: {minimum: 3}
	validates :done_flag, presence: true, inclusion: {in: %w{true false} }
	validates :deadline, presence: true
end
