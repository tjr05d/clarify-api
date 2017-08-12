class Clarification < ApplicationRecord
    enum state: [:closed, :open, :pending]
end
