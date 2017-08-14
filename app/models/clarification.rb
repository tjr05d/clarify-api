class Clarification < ApplicationRecord
    enum state: [:open, :pending, :closed]
    has_many :responses

    def self.check_for_similar(url, comparison_text)
      sim_threshold = 0.70
      url_clarifications = self.where(url: url)
      url_clarifications.select { | uc | uc.check_similarity(comparison_text, sim_threshold) } 
    end
    
    def check_similarity(comparison_text, threshold)
      existing_tokens = self.selection.split
      new_tokens = comparison_text.split
      token_intersection = existing_tokens & new_tokens

      (token_intersection.count.to_f / existing_tokens.count) >= threshold
    end 

end

