class Feedback
  include ActiveModel::Validations
  
  # Id required by form.
  attr_accessor :id, :name, :email, :subject, :message
  attr_reader :data
  
  validates_presence_of :name, :email, :subject, :message
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => "Your email is invalid."
  
  def initialize(attributes={})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
  
  def read_attribute_for_validation(key)
    @attributes[key]
  end
  
  def to_key
  end
  
  def save
    if self.valid?
      FeedbackMailer.send_feedback(self).deliver!
      true
    else
      false
    end
  end
  
end