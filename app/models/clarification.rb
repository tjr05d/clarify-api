class Clarification < ApplicationRecord
    enum state: [:open, :pending, :closed]

    def self.check_for_similar(url, selection)
      sim_threshold = 0.70
      url_clarifications = self.where(url: url)
      url_clarifications.select { | uc | uc.check_similarity(uc, sim_threshold) } 
    end
    
    private 
    def check_similarity(comparision_obj, threshold)
      existing_tokens = self.selection.split
      new_tokens = comparison_obj.selection.split
      token_intersection = existing_tokens & new_tokens
      
      (token_intersection.count / existing_tokens.count) >= threshold) || (token_intersection.count / new_tokens.count ) >= threshold
    end 

end
