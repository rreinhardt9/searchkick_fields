class Lesson < ApplicationRecord
  belongs_to :company

  searchkick

  def search_data
    {
      company_id: company.id,
      title: title,
      description: description
    }
  end
end
