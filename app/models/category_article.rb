# frozen_string_literal: true

class CategoryArticle < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
