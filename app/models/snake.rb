class Snake < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 6 }
  before_save :capitalize_name

  validate :name_is_a_word

  def name_is_a_word
    unless self.name =~ /^[[:alnum]- ]+$/
      errors.add(:name, "Must be word characters.")
    end
  end

  def capitalize_name
    self.name.capitalize!
  end

  def name_must_be_capitalized
    unless name.capitalize == name
      errors.add(:name, "Must be capitalized")
    end
  end
end
